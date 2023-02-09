"""User View tests."""

import os
#from seed import seed_pokemon_table_data_text_db
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


class UserViewTestCase(TestCase):
    """Test views for users."""

    def setUp(self):
        """Create test client, add sample data."""

        with app.app_context():
            #db.drop_all()
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
            #db.drop_all()
            return res
    
    
    def test_homepage(self):
        """homepage or landing page test"""
        with self.client as client:
            resp = client.get("/")
            html = resp.get_data(as_text=True)
            self.assertEqual(resp.status_code, 200)
        
        with self.client as client:
            with client.session_transaction() as session:
                session[CURR_USER_KEY] = self.uid
            resp = client.get("/")
            html = resp.get_data(as_text=True)
            self.assertEqual(resp.status_code, 200)
            self.assertIn("Profile", str(resp.data))
            
    def test_edit_profile_page(self):
        """testing edit profile"""
        with self.client as client:
            resp = client.get("/users/profile", follow_redirects=True)
            self.assertEqual(resp.status_code, 200)
            self.assertIn("Access unauthorized.", str(resp.data))
            
        with self.client as client:
            with client.session_transaction() as session:
                session[CURR_USER_KEY] = self.uid
            resp = client.get("/users/profile")
            self.assertEqual(resp.status_code, 200)
            self.assertIn("Edit your profile!", str(resp.data))
    
    def test_editing_profile(self):
        """testing editing user profile"""
        
        with self.client as client:
            with client.session_transaction() as session:
                session[CURR_USER_KEY] = self.uid
            d = {"username": "testuser5", "password": "HASHED_PASSWORD", "email": "test@test.com"}
            resp = client.post("/users/profile", data=d, follow_redirects=True)
            html = resp.get_data(as_text=True)
            self.assertEqual(resp.status_code, 200)
            self.assertIn("Profile has been successfully updated!", html)
            u = User.query.get(1)
            self.assertEqual(u.username, "testuser5")
    
    
    def test_user_favorites_page(self):
        """testing user favoriting pokemon"""
        
        with self.client as client:
            resp = client.get(f"/users/{1}/favorites", follow_redirects=True)
            self.assertEqual(resp.status_code, 200)
            self.assertIn("Access unauthorized.", str(resp.data))
            
        with self.client as client:
            with client.session_transaction() as session:
                session[CURR_USER_KEY] = self.uid
            resp = client.get(f"/users/{1}/favorites", follow_redirects=True)
            self.assertEqual(resp.status_code, 200)
            self.assertIn("Here are your current favorited", str(resp.data))
    
    
    def test_favoriting_pokemon(self):
        """testing user favoriting pokemon"""
        
        with self.client as client:
            with client.session_transaction() as session:
                session[CURR_USER_KEY] = self.uid
            resp = client.get(f"/users/toggle_favorite/{1}")
            self.assertEqual(resp.json, {"pokemon_favorited": True})
        
        with self.client as client:
            with client.session_transaction() as session:
                session[CURR_USER_KEY] = self.uid
            resp = client.get(f"/users/{1}/favorites")
            self.assertEqual(resp.status_code, 200)
            self.assertIn("Here are your current favorited", str(resp.data))
            self.assertIn("bulbasaur", str(resp.data))
        
        with self.client as client:
            with client.session_transaction() as session:
                session[CURR_USER_KEY] = self.uid
            resp = client.get(f"/users/toggle_favorite/{1}")
            self.assertEqual(resp.json, {"pokemon_favorited": False})
        
        with self.client as client:
            with client.session_transaction() as session:
                session[CURR_USER_KEY] = self.uid
            resp = client.get(f"/users/{1}/favorites")
            self.assertEqual(resp.status_code, 200)
            self.assertNotIn("Bulbasaur", str(resp.data))
            
            
    def test_saved_teams_page(self):
        """testing user saved teams page"""
        
        with self.client as client:
            resp = client.get(f"/users/{1}/saved_teams", follow_redirects=True)
            self.assertEqual(resp.status_code, 200)
            self.assertIn("Access unauthorized.", str(resp.data))
            
        with self.client as client:
            with client.session_transaction() as session:
                session[CURR_USER_KEY] = self.uid
            resp = client.get(f"/users/{1}/saved_teams")
            self.assertEqual(resp.status_code, 200)
            
        # saved team functionality might need to add stuff to page still, not sure about testing creating a team or not