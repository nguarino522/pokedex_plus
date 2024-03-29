import os
from flask import Flask, render_template, request, flash, redirect, session, g, jsonify
from models import connect_db, User, db, Pokemon, Favorite, PokemonTeam, PokemonTeamMember
from forms import UserAddForm, LoginForm, UserEditProfileForm
from sqlalchemy.exc import IntegrityError
from config import BASE_API_URL, SURPRISED_PIKACHU_IMG
import math, requests, random
from flask_caching import Cache
from flask_apscheduler import APScheduler

CURR_USER_KEY = "curr_user"

cache = Cache(config={"CACHE_TYPE": "FileSystemCache", "CACHE_DIR": "app_cache"})
app = Flask(__name__)
cache.init_app(app)

# Get DB_URI from environ variable (useful for production/testing) or,
# if not set there, use development local db.
app.config['SQLALCHEMY_DATABASE_URI'] = (
    os.environ.get('DATABASE_URL', 'postgresql:///pokedex_plus'))

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = False
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False
app.config['SECRET_KEY'] = os.environ.get('SECRET_KEY', "6uar1n0")

# testing
app.config['SQLALCHEMY_ENGINE_OPTIONS'] = {"pool_pre_ping": True}

connect_db(app)


###########################################################
# For making sure we hit Supabase DB once a day at least so it doesn't get shutdown for being idle
def check_db_connection():
    is_database_working = True
    output = 'database is ok'
    print(is_database_working,output)
    try:
        db.session.execute('SELECT 1')
    except Exception as e:
        output = str(e)
        is_database_working = False
        
    return is_database_working, output

scheduler = APScheduler()
scheduler.add_job(func=check_db_connection, trigger='interval', id='job', hours=1)
scheduler.start()






##############################################################################
# User signup/login/logout

@app.before_request
def add_user_to_g():
    """If we're logged in, add curr user to Flask global."""

    if CURR_USER_KEY in session:
        g.user = User.query.get(session[CURR_USER_KEY])
    else:
        g.user = None


def do_login(user):
    """Log in user."""

    session[CURR_USER_KEY] = user.id


def do_logout():
    """Logout user."""

    if CURR_USER_KEY in session:
        del session[CURR_USER_KEY]


@app.route('/signup', methods=["GET", "POST"])
def signup():
    """Handle user signup.
    Create new user and add to DB. Redirect to home page.
    If form not valid, present form.
    If the there already is a user with that username: flash message
    and re-present form.
    """

    form = UserAddForm()
    if form.validate_on_submit():
        try:
            user = User.signup(
                username=form.username.data,
                password=form.password.data,
                email=form.email.data,
                profile_img_url=form.profile_img_url.data or User.profile_img_url.default.arg,
            )
            db.session.commit()

        except IntegrityError:
            flash("Username/email already taken", "danger")
            return render_template("users/signup.html", form=form)

        do_login(user)

        return redirect("/")

    else:
        return render_template("users/signup.html", form=form)


@app.route('/login', methods=["GET", "POST"])
def login():
    """Handle user login."""

    form = LoginForm()
    if form.validate_on_submit():
        user = User.authenticate(form.username.data,
                                 form.password.data)

        if user:
            do_login(user)
            flash(f"Hello, {user.username}!", "success")
            return redirect("/")

        flash("Invalid credentials.", "danger")

    return render_template('users/login.html', form=form)


@app.route('/logout')
def logout():
    """Handle logout of user."""

    do_logout()
    flash("You have successfully been logged out.", "success")
    return redirect("/login")


##############################################################################
# general route handling:
@app.route('/')
def index_main():
    """main landing page"""

    pokemons = []
    for x in range(3):
        p = Pokemon.get_random_pokemon()
        pokemons.append(p)
    
    return render_template("index.html", user=g.user, pokemons=pokemons)


##############################################################################
# pokedex route handling:
@app.route('/pokedex/<int:page_num>')
def main_pokemon_page(page_num):
    """main pokemon view/landing page"""

    page_offset = (page_num - 1) * 15
    total_pages = math.ceil(Pokemon.query.count() / 15)
    pokemons = Pokemon.query.limit(15).offset(page_offset).all()
    if not pokemons:
        return render_template("404.html"), 404

    if g.user:
        fav_ids = Favorite.get_all_favorited_pokemon_ids(g.user)
        return render_template("pokemon/index.html", pokemons=pokemons, page_num=page_num, total_pages=total_pages, fav_ids=fav_ids)
    else:
        return render_template("pokemon/index.html", pokemons=pokemons, page_num=page_num, total_pages=total_pages)



# caching items but not sure if persistence working --> seems like it? unless maybe I make a change here in app.py... ?idk
@app.route('/pokedex/pokemon/<pokemon_name>')
def single_pokemon_page(pokemon_name):
    """view a single pokemon entry"""

    pokemon_db = Pokemon.query.filter_by(name=pokemon_name).first()
    if not pokemon_db:
        return render_template("404.html"), 404

    fav_pid = None
    if g.user:
        favorite = Favorite.query.filter_by(pokemon_id=pokemon_db.pid, user_id=g.user.id).first()
        if favorite:
            fav_pid = pokemon_db.pid
    
    pokemon_cache = cache.get(pokemon_name)
    if pokemon_cache is None:
        pokemon = Pokemon.retrieve_pokemon_data(pokemon_name)
        pokefacts = Pokemon.get_pokemon_facts(pokemon_name)
        ability_facts = Pokemon.get_pokemon_ability_data(pokemon_name)
        evolutions = Pokemon.get_evolution_data(pokemon_name)
        cache.set(pokemon_name, {"pokemon": pokemon, "pokefacts": pokefacts, "ability_facts": ability_facts, "evolutions": evolutions})
        pokefact = random.choice(pokefacts)
        return render_template("pokemon/show.html", pokemon=pokemon, pokefact=pokefact, pokemon_db=pokemon_db, ability_facts=ability_facts, evolutions=evolutions, fav_pid=fav_pid)
    else:
        pokefact = random.choice(pokemon_cache["pokefacts"])
        return render_template("pokemon/show.html", pokemon=pokemon_cache["pokemon"], pokefact=pokefact, pokemon_db=pokemon_db, ability_facts=pokemon_cache["ability_facts"], evolutions=pokemon_cache["evolutions"], fav_pid=fav_pid)


@app.route('/pokedex/search')
def pokedex_search():
    """search route for pokedex/pokemon"""

    search = request.args.get('q')
    pokemons = Pokemon.query.filter(Pokemon.name.like(f"%{search}%")).all()
    if g.user:
        fav_ids = Favorite.get_all_favorited_pokemon_ids(g.user)
        return render_template("pokemon/search.html", pokemons=pokemons, fav_ids=fav_ids)
    else:
        return render_template("pokemon/search.html", pokemons=pokemons)


##############################################################################
# User routes:
@app.route('/users/profile', methods=["GET", "POST"])
def user_profile():
    """Update profile for current user."""

    if not g.user:
        flash("Access unauthorized.", "danger")
        return redirect("/")

    form = UserEditProfileForm()

    if form.validate_on_submit():
        if User.authenticate(g.user.username, form.password.data):
            g.user.username = form.username.data
            g.user.email = form.email.data
            g.user.profile_img_url = form.profile_img_url.data or g.user.profile_img_url

            db.session.commit()
            flash("Profile has been successfully updated!", "success")
            return redirect("/")

        flash("Incorrect password! Please try again.", 'danger')

    return render_template("users/edit.html", form=form, user_id=g.user.id)

@app.route('/users/favorites')
def user_favorites():
    """show user favorited pokemon"""

    if not g.user:
        flash("Access unauthorized.", "danger")
        return redirect("/")
    
    pokemons = []
    for favorite in g.user.favorites:
        p = Pokemon.query.filter_by(pid=favorite.pokemon_id).first()
        pokemons.append(p)
    
    fav_ids = Favorite.get_all_favorited_pokemon_ids(g.user)
    
    return render_template("users/favorites.html", pokemons=pokemons, fav_ids=fav_ids, pikachu_img=SURPRISED_PIKACHU_IMG)

@app.route('/users/toggle_favorite/<int:pokemon_id>', methods=["GET", "POST"])
def toggle_favorite(pokemon_id):
    """route to toggle favoriting a pokemon"""
    
    if not g.user:
        flash("Access unauthorized.", "danger")
        return redirect("/")
    
    favorite = Favorite.query.filter_by(pokemon_id=pokemon_id, user_id=g.user.id).first()
    
    if favorite:
        db.session.delete(favorite)
        pokemon_favorited = False
    else:
        new_favorite = Favorite(user_id=g.user.id, pokemon_id=pokemon_id)
        pokemon_favorited = True
        db.session.add(new_favorite)
        
    db.session.commit()
    
    return jsonify({"pokemon_favorited": pokemon_favorited})

@app.route('/users/saved_teams')
def user_saved_teams():
    """show user saved teams"""
    
    if not g.user:
        flash("Access unauthorized.", "danger")
        return redirect("/")
    
    pokemon_teams = PokemonTeam.query.filter_by(user_id=g.user.id).all()
    
    return render_template("users/teams.html", pokemon_teams=pokemon_teams, pikachu_img=SURPRISED_PIKACHU_IMG)

@app.route('/users/delete_team/<int:team_id>', methods=["POST"])
def delete_user_saved_teams(team_id):
    """delete saved user team"""
    
    #if not g.user or not g.user.id == user_id:
    if not g.user:
        flash("Access unauthorized.", "danger")
        return redirect("/")
    
    pokemon_team = PokemonTeam.query.filter_by(id=team_id, user_id=g.user.id).first()
    if not pokemon_team:
        flash("ERROR: No team found with that id!", "danger")
        return redirect("/users/saved_teams")
    
    db.session.delete(pokemon_team)
    db.session.commit()
    
    flash("Pokémon Team has been successfully deleted!", "success")
    return redirect(f"/users/saved_teams")



##############################################################################
# tools routes:

@app.route('/tools/team_creator')
def tool_team_creator():
    """route for team creator tool based user and their favorites"""
    
    if not g.user:
        flash("Access unauthorized. Please create an account and log in to use this tool.", "danger")
        return redirect("/")
    
    pokemons = []
    for favorite in g.user.favorites:
        p = Pokemon.query.filter_by(pid=favorite.pokemon_id).first()
        pokemons.append(p)
    
    return render_template("tools/team_creator.html", pokemons=pokemons, pikachu_img=SURPRISED_PIKACHU_IMG)

@app.route('/tools/create_team', methods=["POST"])
def create_pokemon_team():
    """route to create a new pokemon team for user"""
    
    if not g.user.id:
        flash("Access unauthorized.", "danger")
        return redirect("/")
    
    pokemon_ids = request.form["pokemon_ids_text"].split()
    result = PokemonTeam.check_if_all_pokemon_ids_valid(pokemon_ids)
    
    if len(pokemon_ids) == 0:
        flash("Please select at least one Pokémon to create a team.", "danger")
        return redirect("/tools/team_creator")
    elif len(pokemon_ids) > 6:
        flash("Please select no more than 6 Pokémon to create a team.", "danger")
        return redirect("/tools/team_creator")
    elif not result:
        flash("ERROR: invalid input or Pokémon. Please retry...", "danger")
        return redirect("/tools/team_creator")
    else:
        new_pokemon_team = PokemonTeam(user_id=g.user.id)
        db.session.add(new_pokemon_team)
        db.session.commit()
        
        for pid in pokemon_ids:
            new_pokemon_team_member = PokemonTeamMember(pokemon_team_id=new_pokemon_team.id, pokemon_id=pid)
            db.session.add(new_pokemon_team_member)
        db.session.commit()
        
        flash("Pokémon team has been successfully created!", "success")
        return redirect("/tools/team_creator")


@app.route('/tools/win_prob_calc')
def win_prob_calc():
    """route for win probability calculator tool page"""
    
    if not g.user:
        flash("Access unauthorized. Please create an account and log in to use this tool.", "danger")
        return redirect("/")
    
    pokemons = []
    for favorite in g.user.favorites:
        p = Pokemon.query.filter_by(pid=favorite.pokemon_id).first()
        pokemons.append(p)
    
    return render_template("tools/win_prob_calc.html", pokemons=pokemons, pikachu_img=SURPRISED_PIKACHU_IMG)

@app.route('/tools/calculate_win_prob', methods=["POST"])
def calculate_win_prob():
    """route to calculate win probability percentage"""
    
    if not g.user.id:
        flash("Access unauthorized.", "danger")
        return redirect("/")
    
    pokemon_ids = request.form["pokemon_ids_text"].split()
    result = PokemonTeam.check_if_all_pokemon_ids_valid(pokemon_ids)
    
    if len(pokemon_ids) != 2:
        flash("Please select exactly 2 pokemon.", "danger")
        return redirect("/tools/win_prob_calc")
    elif not result:
        flash("ERROR: invalid input or Pokémon. Please retry...", "danger")
        return redirect("/tools/team_creator")
    else:
        # code goes here (perhaps call model object method to calculate?) return percentages back
        
        return render_template("tools/win_prob_calc_result.html")


##############################################################################
# error handling routes:

@app.errorhandler(404)
def page_not_found(e):
    """404 NOT FOUND page."""

    return render_template("404.html", pikachu_img=SURPRISED_PIKACHU_IMG), 404


@app.errorhandler(500)
def error_processing_requst(e):
    """500 SERVER ERROR"""

    return render_template("500.html", pikachu_img=SURPRISED_PIKACHU_IMG), 500


##############################################################################
# Turn off all caching in Flask
#   automatically close all unused/hanging connections and prevent bottleneck in code

@app.teardown_appcontext
def shutdown_session(exception=None):
    db.session.remove()
    
    
# https://stackoverflow.com/a/53715116


# ^^^^ not sure if this helps or hurts performance as may want to use flask-caching module to help performance
