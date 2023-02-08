"""Models for Pokedex Plus App"""

from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from config import DEFAULT_AVATAR_IMG, BASE_API_URL, DEFAULT_NO_POKEMON_IMG
import requests
import random

db = SQLAlchemy()
bcrypt = Bcrypt()

# DO NOT MODIFY THIS FUNCTION


def connect_db(app):
    """Connect to database."""

    db.app = app
    db.init_app(app)


# User class
class User(db.Model):
    """users model"""

    __tablename__ = "users"

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    email = db.Column(db.Text, nullable=False, unique=True)
    username = db.Column(db.Text, nullable=False, unique=True)
    password = db.Column(db.Text, nullable=False)
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



# Pokemon class
class Pokemon(db.Model):
    """pokemon model"""

    __tablename__ = "pokemon"

    pid = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.Text, nullable=False, unique=True)
    image_url = db.Column(db.Text, nullable=False,default=DEFAULT_NO_POKEMON_IMG)
    type1 = db.Column(db.Text, nullable=False)
    type2 = db.Column(db.Text, nullable=True)

    def __repr__(self):
        return f"<Pokemon #{self.pid}: {self.name}>"

    @staticmethod
    def retrieve_pokemon_data(pname):
        """retrieve data about pokemon based on pid"""

        resp = requests.get(f"{BASE_API_URL}/pokemon/{pname}").json()

        return resp

    @staticmethod
    def retrieve_all_pokemon_data():
        """retrieve all data to populate pokemon table in DB"""

        total_num_pokemon = requests.get(
            f"BASE_API_URL/pokemon").json()["count"]
        resp = requests.get(
            f"{BASE_API_URL}/pokemon?limit={total_num_pokemon}").json()

        return resp

    @staticmethod
    def get_random_pokemon_fact(pname):
        """grab a random pokemon fact to display"""

        species_url = requests.get(
            f"{BASE_API_URL}/pokemon/{pname}").json()["species"]["url"]
        resp = requests.get(species_url).json()['flavor_text_entries']
        random_facts = []

        for fact in resp:
            if fact["language"]["name"] == "en":
                random_facts.append(fact["flavor_text"].replace("\x0c", " "))

        if random_facts:
            random_fact = random.choice(random_facts)
            return random_fact
        else:
            return "No information for this pokemon found."

    @staticmethod
    def get_pokemon_ability_data(pname):
        """grab a pokemon's ability data"""

        ability_data = {}

        abilities = requests.get(
            f"{BASE_API_URL}/pokemon/{pname}").json()["abilities"]
        ability_urls = []

        for ability in abilities:
            ability_urls.append(ability["ability"]["url"])

        for url in ability_urls:
            resp = requests.get(url).json()
            for effect in resp["effect_entries"]:
                if effect["language"]["name"] == "en":
                    ability_data[resp["name"]] = effect["effect"]

        return ability_data

    @staticmethod
    def get_evolution_data(pname):
        """grab pokemon evolution data"""

        species_url = requests.get(f"{BASE_API_URL}/pokemon/{pname}").json()["species"]["url"]
        
        if requests.get(species_url).json()["evolution_chain"]:
            evolution_url = requests.get(species_url).json()['evolution_chain']['url']
            evolution_chain = requests.get(evolution_url).json()["chain"]
        
            evolution_names = []
        
            # recursion to get nested evolution chain
            def get_evolution_names(evolution_chain):
                """Extracts evolution names from returned data"""
            
                evolution_names.append(evolution_chain["species"]["name"])
                for evolution in evolution_chain["evolves_to"]:
                    get_evolution_names(evolution)

            get_evolution_names(evolution_chain)
            
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
            
            return evolutions
        
        else:
            return "No information found for pokemon's evolutions."

    @staticmethod
    def get_random_pokemon():
        """grab a random pokemon from db"""
        
        all_pokemon = Pokemon.query.all()
        random_pokemon = random.choice(all_pokemon)
        
        return random_pokemon



# Favorite class
class Favorite(db.Model):
    """favories model"""

    __tablename__ = "favorites"

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_id = db.Column(db.Integer, db.ForeignKey("users.id", ondelete="cascade"))
    pokemon_id = db.Column(db.Integer, db.ForeignKey("pokemon.pid"))

    @staticmethod
    def get_all_favorited_pokemon_ids(user):
        """retrieve all user's favorited pokemon"""

        favorited_pokemon = user.favorites
        fav_pokemon_ids = []
        
        for pokemon in favorited_pokemon:
            fav_pokemon_ids.append(pokemon.pokemon_id)
            
        return fav_pokemon_ids


# PokemonTeam class
class PokemonTeam(db.Model):
    """pokemon teams model"""

    __tablename__ = "pokemon_teams"

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_id = db.Column(db.Integer, db.ForeignKey("users.id", ondelete="cascade"))
    team_members = db.relationship("PokemonTeamMember", backref="team", cascade="all, delete-orphan")

    @staticmethod
    def check_if_all_pokemon_ids_valid(pokemon_ids):
        """check if all ids are valid numbers and in the database"""
        
        valid_num_result = all(pid.isdigit() for pid in pokemon_ids)
        valid_db_result = False
        for pid in pokemon_ids:
            p = Pokemon.query.filter_by(pid=pid).first()
            if p:
                valid_db_result = True
            else:
                valid_db_result = False
        
        if valid_db_result and valid_num_result:
            result = True
        else:
            result = False
        
        return result
    
    

# PokemonTeamMember class
class PokemonTeamMember(db.Model):
    """pokemon teams members model"""

    __tablename__ = "pokemon_team_members"

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    pokemon_id = db.Column(db.Integer, db.ForeignKey("pokemon.pid"))
    pokemon_team_id = db.Column(db.Integer, db.ForeignKey("pokemon_teams.id", ondelete="cascade"))
    pokemon = db.relationship("Pokemon")

    @staticmethod
    def get_all_pokemon_team_members(pokemon_team):
        """get all pokemon team members apart of a pokemon team"""
        
        pokemon_team_members = PokemonTeamMember.query.filter_by(pokemon_team_id=pokemon_team.id).all()
        print(pokemon_team_members)
        
        return pokemon_team_members
    