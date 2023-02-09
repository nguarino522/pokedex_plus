import os
from unittest import TestCase
from sqlalchemy import exc
from models import connect_db, User, db, Favorite

# BEFORE importing app, set an environmental variable to use a different database for tests
os.environ['DATABASE_URL'] = "postgresql:///pokedex_plus_test"

# import app
from app import app, CURR_USER_KEY

# Create our tables (might not be needed? with how pokemon table is setup need to be populated / imported first from test_db_pokemon_table_seed.sql file)
with app.app_context():
    db.create_all()
    

class FavoriteModelTestCase(TestCase):
    """Test models for favorites"""
    
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
            
            f = Favorite(user_id=1, pokemon_id=1)
            
            db.session.add(f)
            db.session.commit()
            
            u = User.query.get(uid)
    
            self.u = u
            self.uid = uid
            
            self.client = app.test_client()
    
    def tearDown(self):
        with app.app_context():
            res = super().tearDown()
            User.query.delete()
            db.session.rollback()
            return res
        
    def test_favorite_model(self):
        """Does basic model work?"""
        with app.app_context():
            favorite = Favorite.query.filter_by(user_id=1).first()
            self.assertEqual(favorite.user_id, 1)
            self.assertEqual(favorite.pokemon_id, 1)
            user_test = User.query.get(self.uid)
            self.assertEqual(len(user_test.favorites), 1)
    
    def test_get_all_favorited_pokemon_ids(self):
        """test get all favorited pokemon ids method"""
        with app.app_context():
            u = User.query.get(self.uid)
            fav_pokemon_ids = Favorite.get_all_favorited_pokemon_ids(u)
            self.assertIsNotNone(fav_pokemon_ids)
            self.assertIsInstance(fav_pokemon_ids, list)
            self.assertEqual(fav_pokemon_ids[0], 1)