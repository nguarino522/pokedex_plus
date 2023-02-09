"""Seed database or update (Pokemon table) with data from API"""

from app import app
from models import db, Pokemon
from config import BASE_API_URL
import requests

with app.app_context():
    db.create_all()

# total_num_pokemon = requests.get(BASE_API_URL).json()["count"]

# resp = requests.get(f"{BASE_API_URL}?limit={total_num_pokemon}").json()

# for pokemon in resp["results"]:
#     print(pokemon["name"], pokemon["url"])

#resp = Pokemon.retrieve_all_pokemon_data()
#resp = Pokemon.retrieve_pokemon_data(10143)


# if resp["sprites"]["other"]["official-artwork"]["front_default"]:
#     image_url = resp["sprites"]["other"]["official-artwork"]["front_default"]
#     print(image_url)
# else:
#     image_url = resp["sprites"]["other"]["official-artwork"]["front_shiny"]
#     print(image_url)

# def seed_pokemon_table_data_text_db():
#     """method to seed into test db during setup"""
    
#     resp = Pokemon.retrieve_all_pokemon_data()
#     db.engine.excute("test_db_pokemon_table_seed.sql")
    


def seed_pokemon_table_data(resp):
    for pokemon in resp["results"]:
        resp = requests.get(pokemon["url"]).json()

        with app.app_context():
            p = Pokemon.query.get(resp["id"])
            if p:
                print(f"pokemon {p} already exists in db, moving to next...")
                continue

        pid = resp["id"]
        name = resp["name"]
        if resp["sprites"]["other"]["official-artwork"]["front_default"]:
            image_url = resp["sprites"]["other"]["official-artwork"]["front_default"]
        elif resp["sprites"]["other"]["official-artwork"]["front_shiny"]:
            image_url = resp["sprites"]["other"]["official-artwork"]["front_shiny"]
        else:
            image_url = None
        type1 = resp["types"][0]["type"]["name"]
        if len(resp["types"]) == 2:
            type2 = resp["types"][1]["type"]["name"]
        else:
            type2 = None

        pkm = Pokemon(pid=pid, name=name, image_url=image_url,
                    type1=type1, type2=type2)
        with app.app_context():
            db.session.add(pkm)
            db.session.commit()
            print(f"pokemon successfully added: {pokemon}")

#resp = Pokemon.retrieve_all_pokemon_data()
#seed_pokemon_table_data(resp)
