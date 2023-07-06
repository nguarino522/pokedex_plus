# Pokedex+ Application 



<div align='center'>
    <img align='center' src="static/images/pokeball.png" alt="Pokédex API" width="200" style="border-radius: 6px;" />
    <br><br>
</div>

<div align="center">
   <a href="https://www.linkedin.com/in/nicholasguarino/">
      <img src="https://img.shields.io/badge/-Nicholas Guarino-0A66C2?style=flat&logo=Linkedin&logoColor=white" style="margin-right:10px;"/>
   </a>
  <a href='https://pokeapi.co/' >
    <img alt='Pokédex API' src="https://img.shields.io/badge/Pokédex API-EF5350"/>
  </a>
</div>
<br><br>

## **Description**
- This is a Pokedex application (built in Python Flask and data sourced from Pokemon API) that makes it easy to search for any pokemon and get stats, type, moves, any other information about them. Users are able to easily view any pokemon to find out stats, type, moves, etc. about them and favorite any they wish. They are also able to also create a team and save or favorite that pokemon team.

- **Future features or in progress/under construction**:
A more unique I wish to implement is a win probability calculator (and maybe also a team win probability).
They will be able to select 2 different liked Pokemon and see what the probably percentage of each beating each other. For the team portion they will select team 1 and then team 2 (that they have saved), and it will compare stats and type, etc. to come out with a potential win probability.

## **Live Website**

- Current hosting is on Fly.io: https://pokedex-plus.fly.dev/
- I am still hosting on Render: https://pokedex-plus.onrender.com/ -> however, performance seems to be better on fly.io for the most part.
- For the PostgreSQL DB, this being hosted on Supabase: https://supabase.com/


## **Tech Stack/Technologies**

This project was made using the following tech stack/technologies:
- [Particles.js](https://vincentgarreau.com/particles.js/)
- [Pokemon API](https://pokeapi.co/)
- [Python](https://docs.python.org/3/)
- [HTML](https://developer.mozilla.org/en-US/docs/Web/HTML)
- [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS)
- [Bootstrap 5](https://getbootstrap.com/docs/5.1/getting-started/introduction/)
- [Font Awesome](https://fontawesome.com/)
- [PostgreSQL](https://www.postgresql.org)
- [Flask](https://flask.palletsprojects.com/en/2.1.x/)
- [Flask-SQLAlchemy](https://flask-sqlalchemy.palletsprojects.com/en/2.x/)
- [Flask-WTForms](https://flask-wtf.readthedocs.io/en/1.0.x/)
- [Flask-Bcrypt](https://flask-bcrypt.readthedocs.io/en/latest/)
- [Jinja](https://jinja.palletsprojects.com/en/3.1.x/)
- [Unittests](https://docs.python.org/3/library/unittest.html)
- [VSCode](https://code.visualstudio.com/docs)

##  **How to Run Locally**

```bash
# Clone Repository
# Once in root directory setup virtual env
$ python3 -m venv venv
$ source venv/bin/activate
$ pip install -r requirements.txt
# Source and seed your local PostgreSQL DB
$ python3 seed.py
# Run the application locally
$ flask run
```