"""Models for Pokedex Plus App"""

from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from config import DEFAULT_AVATAR_IMG, BASE_API_URL, DEFAULT_NO_POKEMON_IMG
import requests

db = SQLAlchemy()
bcrypt = Bcrypt()

# DO NOT MODIFY THIS FUNCTION
def connect_db(app):
    """Connect to database."""

    db.app = app
    db.init_app(app)
    

class User(db.Model):
    """users model"""
    
    __tablename__ = "users"
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    email = db.Column(db.Text, nullable=False, unique=True)
    username = db.Column(db.Text,nullable=False,unique=True)
    password = db.Column(db.Text,nullable=False)
    profile_img_url = db.Column(db.Text, nullable=True, default=DEFAULT_AVATAR_IMG)
    favorites = db.relationship("Favorite", backref="user", cascade="all, delete-orphan")
    pokemon_teams = db.relationship("PokemonTeam", backref="user", cascade="all, delete-orphan")
    
    def __repr__(self):
        return f"<User #{self.id}: {self.username}, {self.email}>"
    
    @classmethod
    def signup(cls, username, email, password, profile_img_url):
        """Sign up user.
        Hashes password and adds user to system.
        """

        hashed_pwd = bcrypt.generate_password_hash(password).decode("UTF-8")

        user = User(
            username=username,
            email=email,
            password=hashed_pwd,
            profile_img_url=profile_img_url
        )

        db.session.add(user)
        return user

    @classmethod
    def authenticate(cls, username, password):
        """Find user with `username` and `password`.
        This is a class method (call it on the class, not an individual user.)
        It searches for a user whose password hash matches this password
        and, if it finds such a user, returns that user object.
        If can't find matching user (or if password is wrong), returns False.
        """

        user = cls.query.filter_by(username=username).first()

        if user:
            is_auth = bcrypt.check_password_hash(user.password, password)
            if is_auth:
                return user

        return False


class Pokemon(db.Model):
    """pokemon model"""
    
    __tablename__ = "pokemon"
    
    pid = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.Text,nullable=False,unique=True)
    img_url = db.Column(db.Text, nullable=False, default=DEFAULT_NO_POKEMON_IMG)
    type1 = db.Column(db.Text, nullable=False)
    type2 = db.Column(db.Text, nullable=True)
    
    def __repr__(self):
        return f"<Pokemon #{self.pid}: {self.name}>"
    
    @staticmethod
    def retrieve_pokemon_data(pid):
        """retrieve data about pokemon based on pid"""
        
        resp = requests.get(f"{BASE_API_URL}/{pid}").json()
        return resp
        
    @staticmethod
    def retrieve_all_pokemon_data():
        """retrieve all data to populate pokemon table in DB"""
        
        total_num_pokemon = requests.get(BASE_API_URL).json()["count"]
        resp = requests.get(f"{BASE_API_URL}?limit={total_num_pokemon}").json()
        
        return resp
        
    
class Favorite(db.Model):
    """favories model"""
    
    __tablename__ = "favorites"
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_id = db.Column(db.Integer,db.ForeignKey("users.id", ondelete="cascade"))
    pokemon_id = db.Column(db.Integer,db.ForeignKey("pokemon.pid"))
    

class PokemonTeam(db.Model):
    """pokemon teams model"""
    
    __tablename__ = "pokemon_teams"
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_id = db.Column(db.Integer,db.ForeignKey("users.id", ondelete="cascade"))
    team_members = db.relationship("PokemonTeamMember", backref="team", cascade="all, delete-orphan")

class PokemonTeamMember(db.Model):
    """pokemon teams members model"""
    
    __tablename__ = "pokemon_team_members"
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    pokemon_id = db.Column(db.Integer,db.ForeignKey("pokemon.pid"))
    pokemon_team_id = db.Column(db.Integer,db.ForeignKey("pokemon_teams.id", ondelete="cascade"))