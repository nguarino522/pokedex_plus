# Pokedex Plus

## Pokedex application and team win probability calculator:

### Project Overview: 
#### 1. What goal will your website be designed to achieve? 
Pokedex application that makes it easy to search for any pokemon and get stats, type, moves, any other information about them. Users are able to easily view any pokemon to find out stats, type, moves, etc. about them and favorite any they wish. They will be able to also create a team and save or favorite that pokemon team.

A more unique I wish to implement There will be a team win probability calculator:
Select team 1 and then team 2, and it will compare stats and type, etc. to come out with a potential win probability.
This can potentially expanded and as a lot more possibilities but could get too complex if not careful.
### Functionality:
- Users can login and create an account
- Sign up users
- Login / logout
- User profile
  - Favorite pokemon, and able to save pokemon teams they created
- Search for pokemon (pokedex) (with or without profile)
- Biggest functionality which will be last to add, can select a pokemon or team of pokemon (or from a favorite or saved team and do a probability calculation of who will win, it will spit out a percent change of each side of how likely they are to win.


#### 2. What kind of users will visit your site? In other words, what is the demographic of your users? 
Anybody that is a fan of pokemon or playing the games. Ages could be young kids to adults.

#### 3. What data do you plan on using? You may have not picked your actual API yet, which is fine, just outline what kind of data you would like it to contain. 

- Plan on using this API: https://pokeapi.co/
- Data could be the following:
  - Pokemon
  - Stats for the pokemon
  - Type of the pokemon
  - Pokemon number
  - etc.
- Depending how much we need to pull to be able to provide a probability calculation (if we get that far on the capstone project).


#### 4. In brief, outline your approach to creating your project (knowing that you may not know everything in advance and that these details might change later). Answer questions like the ones below, but feel free to add more information: 

##### a. What does your database schema look like? 
Users, teams, favorites tables, pokemon

##### b. What kinds of issues might you run into with your API? 
Rate limiting perhaps as it is a heavily used API.
	
##### c. Is there any sensitive information you need to secure?
We will need to secure user passwords. Would like to add extra account verification like email passcode perhaps when creating an account, so it can’t be spammed.

 ##### d. What will the user flow look like?
Users won’t have to create a login to just view the pokedex, but to favorite pokemon, create their own teams and save them, and do a problem calculation


 ##### e. What features make your site more than CRUD? Do you have any stretch goals?
Potentially doing the probability calculation, the more accurate we want to make it the more work time and effort it will take to get correct. 
