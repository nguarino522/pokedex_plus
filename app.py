import os
from flask import Flask, render_template, request, flash, redirect, session, g, jsonify
from models import connect_db, User, db, Pokemon
from forms import UserAddForm, LoginForm, UserEditProfileForm
from sqlalchemy.exc import IntegrityError


CURR_USER_KEY = "curr_user"

app = Flask(__name__)

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
# pokemon route handling:
@app.route('/pokemon')
def pokemon_page():
    """main pokemon view page"""
    
        
    return render_template("pokemon/index.html")



##############################################################################
# General user routes:
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