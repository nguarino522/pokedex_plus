"""Pokemon model tests."""

import os
from unittest import TestCase
from models import connect_db, User, db, Pokemon, Favorite, PokemonTeam, PokemonTeamMember

# BEFORE importing app, set an environmental variable to use a different database for tests
os.environ['DATABASE_URL'] = "postgresql:///pokedex_plus_test"

# import app
from app import app, CURR_USER_KEY

# Create our tables (might not be needed? with how pokemon table is setup need to be populated / imported first from test_db_pokemon_table_seed.sql file)
with app.app_context():
    db.create_all()


class PokemonModelTestCase(TestCase):
    """Test models for users."""

    def setUp(self):
        """Create test client, add sample data."""
        with app.app_context():
            db.create_all()
            User.query.delete()
            
            u = User.signup("testuser", "test@test.com", "HASHED_PASSWORD", None)
            uid = 1
            u.id = uid
            
            db.session.add(u)
            db.session.commit()
            
            u = User.query.get(uid)
            p1 = Pokemon.query.get(1)
            p2 = Pokemon.query.get(2)
            p3 = Pokemon.query.get(3)
            
            self.u = u
            self.uid = uid
            self.p1 = p1
            self.p2 = p2
            self.p3 = p3
            
            self.client = app.test_client()
    
    def tearDown(self):
        with app.app_context():
            res = super().tearDown()
            User.query.delete()
            db.session.rollback()
            return res
        

    def test_pokemon_model(self):
        """Does basic model work?"""
        with app.app_context():
            pokemon = Pokemon.query.get(1)
            self.assertEqual(pokemon.name, "bulbasaur")
            self.assertEqual(pokemon.type1, "grass")
            self.assertEqual(pokemon.type2, "poison")
    
    def test_repr_method(self):
        """Does the repr method work as expected?"""

        self.assertEqual(repr(self.p1), f"<Pokemon #1: bulbasaur>")
    
    def test_retrieve_pokemon_data(self):
        """testing retrieve pokemon data method"""
        with app.app_context():
            pokemon = Pokemon.retrieve_pokemon_data(self.p1.name)
            self.assertIsNotNone(pokemon)
            self.assertIsInstance(pokemon, dict)
            self.assertEqual(pokemon["id"], 1)
            self.assertEqual(pokemon["name"], "bulbasaur")
    
    def test_get_pokemon_facts(self):
        """testing get pokemon facts method"""
        with app.app_context():
            pokefacts = Pokemon.get_pokemon_facts(self.p1.name)
            self.assertIsNotNone(pokefacts)
            self.assertIsInstance(pokefacts, list)

    def test_get_pokemon_ability_data(self):
        """testing get pokmeon ability data method"""
        ability_facts = Pokemon.get_pokemon_ability_data(self.p1.name)
        self.assertIsNotNone(ability_facts)
        self.assertIsInstance(ability_facts, dict)
        
    def test_get_evolution_data(self):
        """testing get pokemon facts method"""
        with app.app_context():
            evolutions = Pokemon.get_evolution_data(self.p1.name)
            self.assertIsNotNone(evolutions)
            self.assertIsInstance(evolutions, list)
            self.assertEqual(evolutions[0].name, "bulbasaur")
            self.assertEqual(evolutions[1].name, "ivysaur")
            self.assertEqual(evolutions[2].name, "venusaur")
            
    def test_get_random_pokemon(self):
        """test get random pokemon"""
        with app.app_context():
            pokemon = Pokemon.get_random_pokemon()
            self.assertIsNotNone(pokemon)
            self.assertIsInstance(pokemon, object)
