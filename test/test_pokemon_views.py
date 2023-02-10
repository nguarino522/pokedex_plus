"""Pokemon View tests."""

import os
from unittest import TestCase
from models import connect_db, User, db, Pokemon, Favorite, PokemonTeam, PokemonTeamMember

# BEFORE importing app, set an environmental variable to use a different database for tests
os.environ['DATABASE_URL'] = "postgresql:///pokedex_plus_test"

# import app
from app import app, CURR_USER_KEY

# Make Flask errors be real errors, rather than HTML pages with error info
app.config['TESTING'] = True

# Create our tables (might not be needed? with how pokemon table is setup need to be populated / imported first from test_db_pokemon_table_seed.sql file)
with app.app_context():
    db.create_all()

# Don't have WTForms use CSRF at all, since it's a pain to test
app.config['WTF_CSRF_ENABLED'] = False


class PokemonViewTestCase(TestCase):
    """Test pokemon views."""
    
    def setUp(self):
        """Create test client, add sample data."""

        with app.app_context():
            db.create_all()
            User.query.delete()
            Favorite.query.delete()

            u = User.signup("testuser", "test@test.com", "HASHED_PASSWORD", None)
            uid = 1
            u.id = uid

            db.session.add(u)
            db.session.commit()
            
            self.u = u 
            self.uid = uid
            self.client = app.test_client()
    
    def tearDown(self):
        
        with app.app_context():
            res = super().tearDown()
            User.query.delete()
            Favorite.query.delete()
            db.session.rollback()
            return res
    
    
    def test_main_pokedex_page(self):
        """testing main index pokedex page"""
        
        with self.client as client:
            resp = client.get(f"/pokedex/1")
            self.assertEqual(resp.status_code, 200)
            self.assertIn("bulbasaur", str(resp.data))
            self.assertIn("charmander", str(resp.data))
            self.assertIn("beedrill", str(resp.data))
            self.assertIn("Search", str(resp.data))
            
    
    def test_main_pokedex_page_2(self):
        """testing second page pokedex"""
        
        with self.client as client:
            resp = client.get(f"/pokedex/2")
            self.assertEqual(resp.status_code, 200)
            self.assertIn("nidorina", str(resp.data))
            self.assertIn("pikachu", str(resp.data))
            self.assertIn("pidgey", str(resp.data))
            self.assertIn("Search", str(resp.data))
            
    
    def test_user_favorite_pokedex_page(self):
        """testing when a user favorites a pokemon on pokedex page"""
        
        with self.client as client:
            with client.session_transaction() as session:
                session[CURR_USER_KEY] = self.uid
            resp = client.get(f"/pokedex/1")
            self.assertEqual(resp.status_code, 200)
            self.assertIn("bulbasaur", str(resp.data))
            self.assertIn("charmander", str(resp.data))
            self.assertIn("beedrill", str(resp.data))
            self.assertIn("Search", str(resp.data))
            self.assertNotIn("favorited", str(resp.data))
            client.get(f"/users/toggle_favorite/{1}")
            resp = client.get(f"/pokedex/1")
            self.assertIn("favorited", str(resp.data))
            
    
    def test_pokedex_search_page(self):
        """testing the search page and functionality"""
        
        with self.client as client:
            resp = client.get("/pokedex/search?q=articuno")
            self.assertEqual(resp.status_code, 200)
            self.assertIn("articuno", str(resp.data))
            self.assertIn("Here are your search results! Feel free to search again:", str(resp.data))
    
    def test_pokedex_search_page_user_favoriting(self):
        """testing user favoriting pokemon on search page"""
        
        with self.client as client:
            with client.session_transaction() as session:
                session[CURR_USER_KEY] = self.uid
            resp = client.get("/pokedex/search?q=articuno")
            self.assertEqual(resp.status_code, 200)
            self.assertIn("articuno", str(resp.data))
            self.assertIn("Here are your search results! Feel free to search again:", str(resp.data))
            self.assertNotIn("favorited", str(resp.data))
            client.get(f"/users/toggle_favorite/{144}")
            resp = client.get("/pokedex/search?q=articuno")
            self.assertIn("favorited", str(resp.data))
            
    
    def test_show_single_pokemon_page(self):
        """testing page to show single pokemon"""
        
        with self.client as client:
            resp = client.get("/pokedex/pokemon/articuno")
            self.assertEqual(resp.status_code, 200)
            self.assertIn("articuno", str(resp.data))
            self.assertIn("ice", str(resp.data))
            self.assertIn("flying", str(resp.data))
    
    def test_show_single_pokemon_page_user_favoriting(self):
        """testing user favoriting on single pokemon page"""
        
        with self.client as client:
            with client.session_transaction() as session:
                session[CURR_USER_KEY] = self.uid
            resp = client.get("/pokedex/pokemon/articuno")
            self.assertEqual(resp.status_code, 200)
            self.assertIn("articuno", str(resp.data))
            self.assertIn("ice", str(resp.data))
            self.assertIn("flying", str(resp.data))
            self.assertNotIn("favorited", str(resp.data))
            resp = client.get("/pokedex/pokemon/articuno")
            client.get(f"/users/toggle_favorite/{144}")
            resp = client.get("/pokedex/pokemon/articuno")
            self.assertIn("favorited", str(resp.data))