import os
from flask import Flask, render_template, request, flash, redirect, session, g, jsonify
from models import connect_db, User, db, Pokemon, Favorite
from forms import UserAddForm, LoginForm, UserEditProfileForm
from sqlalchemy.exc import IntegrityError
from config import BASE_API_URL
import math, requests
from flask_caching import Cache

CURR_USER_KEY = "curr_user"

cache = Cache(config={'CACHE_TYPE': 'SimpleCache'})
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

connect_db(app)


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

    return render_template("index.html")


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

    return render_template("pokemon/index.html", pokemons=pokemons, page_num=page_num, total_pages=total_pages)


# added in flask-caching support to help cache routes and increase performance
# for now 5 minute timeout on cache, may do infinite after, 
# the problem is that once cached it won't get a differen pokemon fact based on how it grabs it currently
# woudl have to move some of the code from model to here in route maybe????? ....
@app.route('/pokedex/pokemon/<pokemon_name>')
#@cache.cached(timeout=60)
def single_pokemon_page(pokemon_name):
    """view a single pokemon entry"""

    pokemon_db = Pokemon.query.filter_by(name=pokemon_name).first()
    if not pokemon_db:
        return render_template("404.html"), 404

    pokemon = Pokemon.retrieve_pokemon_data(pokemon_name)
    pokefact = Pokemon.get_random_pokemon_fact(pokemon_name)
    ability_facts = Pokemon.get_pokemon_ability_data(pokemon_name)
    evolution_names = Pokemon.get_evolution_data(pokemon_name)
    if evolution_names == "No information found for pokemon's evolutions.":
        evolutions = evolution_names
    else:
        evolutions = []
        for name in evolution_names:
            p = Pokemon.query.filter_by(name=name).first()
            if p:
                evolutions.append(p)
            else:
                p = Pokemon.query.filter(Pokemon.name.like(f"%{name}%")).all()
                for p in p:
                    evolutions.append(p)

    fav_pid = None
    if g.user:
        favorite = Favorite.query.filter_by(pokemon_id=pokemon_db.pid, user_id=g.user.id).first()
        if favorite:
            fav_pid = pokemon_db.pid
    
    # ability_facts=ability_facts increases page load time, need to investigate later when polishing 
    # UPDATE through testing others apps will be much quicker in prod
    # UPDATE UPDATE ^ flask-caching is an option which will use as well but issues to work out still
    print(evolutions)
    return render_template("pokemon/show.html", pokemon=pokemon, pokefact=pokefact, pokemon_db=pokemon_db, ability_facts=ability_facts, evolutions=evolutions, fav_pid=fav_pid)


@app.route('/pokedex/search')
def pokedex_search():
    """search route for pokedex/pokemon"""

    search = request.args.get('q')
    pokemons = Pokemon.query.filter(Pokemon.name.like(f"%{search}%")).all()

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

@app.route('/users/<int:user_id>/favorites')
def user_favorites(user_id):
    """Show user favorited pokemon"""

    if not g.user:
        flash("Access unauthorized.", "danger")
        return redirect("/")
    pokemons = []
    for favorite in g.user.favorites:
        p = Pokemon.query.filter_by(pid=favorite.pokemon_id).first()
        pokemons.append(p)
    
    return render_template("users/favorites.html", pokemons=pokemons)

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
    

##############################################################################
# error handling routes:

@app.errorhandler(404)
def page_not_found(e):
    """404 NOT FOUND page."""

    return render_template("404.html"), 404


@app.errorhandler(500)
def error_processing_requst(e):
    """500 SERVER ERROR"""

    return render_template("500.html"), 500


##############################################################################
# Turn off all caching in Flask
#   automatically close all unused/hanging connections and prevent bottleneck in code

@app.teardown_appcontext
def shutdown_session(exception=None):
    db.session.remove()
    
    
# https://stackoverflow.com/a/53715116


# ^^^^ not sure if this helps or hurts performance as may want to use flask-caching module to help performance
