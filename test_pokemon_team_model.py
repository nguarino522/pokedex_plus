"""PokemonTeam model tests."""

from app import app, CURR_USER_KEY
import os
from unittest import TestCase
from sqlalchemy import exc
from models import connect_db, User, db, Favorite, PokemonTeam, PokemonTeamMember

# BEFORE importing app, set an environmental variable to use a different database for tests
os.environ['DATABASE_URL'] = "postgresql:///pokedex_plus_test"

# import app

# Create our tables (might not be needed? with how pokemon table is setup need to be populated / imported first from test_db_pokemon_table_seed.sql file)
with app.app_context():
    db.create_all()


class PokemonTeamModelTestCase(TestCase):
    """Test for models for Pokemon teams."""

    def setUp(self):
        """Create test client, add sample data."""
        with app.app_context():
            db.create_all()
            User.query.delete()
            Favorite.query.delete()
            PokemonTeam.query.delete()
            PokemonTeamMember.query.delete()

            u = User.signup("testuser", "test@test.com", "HASHED_PASSWORD", None)
            uid = 1
            u.id = uid

            db.session.add(u)
            db.session.commit()

            f = Favorite(user_id=1, pokemon_id=1)
            pt = PokemonTeam(user_id=1)
            pt.id = 1

            db.session.add_all([f, pt])
            db.session.commit()

            ptm = PokemonTeamMember(pokemon_id=1, pokemon_team_id=1)

            db.session.add(ptm)
            db.session.commit()

            u = User.query.get(uid)

            self.u = u
            self.uid = uid

            self.client = app.test_client()

    def tearDown(self):
        with app.app_context():
            res = super().tearDown()
            User.query.delete()
            Favorite.query.delete()
            PokemonTeam.query.delete()
            PokemonTeamMember.query.delete()
            db.session.rollback()
            return res

    def test_pokemon_team_model(self):
        """Does basic model work?"""
        with app.app_context():
            team = PokemonTeam.query.filter_by(user_id=1).first()
            self.assertEqual(len(team.team_members), 1)

    def test_pokemon_team_member_model(self):
        """Does basic model work?"""
        with app.app_context():
            team_member = PokemonTeamMember.query.filter_by(pokemon_team_id=1).first()
            self.assertEqual(team_member.pokemon.name, "bulbasaur")
            
    def test_check_if_all_pokemon_ids_valid(self):
        """test if check all pokemon ids valid method works"""
        with app.app_context():
            result = PokemonTeam.check_if_all_pokemon_ids_valid(["1","2","3","4"])
            result1 = PokemonTeam.check_if_all_pokemon_ids_valid(["1","2","3","4","234523"])
            self.assertEqual(result, True)
            self.assertEqual(result1, False)