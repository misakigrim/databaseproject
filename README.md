# databaseproject

*This is a database project that doubles as a game. An adventure game! 

## Mighty Badlands
This is the second project I have built. It's currently depolyed on [Heroku](https://mighty-badlands-41728.herokuapp.com/) and has been written using HTML, CSS and Javascript, PostgreSQL, and Python. The concept behind the app was to showcase the ability of AI generated images (see problems) in some form of gamification. Taking a page out of the old [Goosebumps](https://en.wikipedia.org/wiki/Give_Yourself_Goosebumps), the game will allow you to progress by making decisions.

App features

    - Decision-based progession
    - Story-based adventure game
    - Text prompt AI-generated art

## How to install (for Mac OS)

    1. On your terminal, create the database: `createdb mbgame`
    2. Import the table set: `psql -d mbgame < schema.sql`
    3. Import the table data: `psql -d mbgame < seed.sql`
    4. Navigate to the 'database project' folder in the terminal
    5. On your terminal, import the libraries: `pip install requirements.txt`
    6. Enter virtual environment: 
        6.1)`python -m venv venv`
        6.2)`source venv/bin/activate`
        6.3) Once you see that there is a '(venv)' prefixing your command line, run `python app.py`

Complications:
- Too many tables
- Adding an inventory system (not used)
- Adding an encounter table (not used)
- No AI-generative API that can work fast enough to render on load for user
- Tracking decisions and story structure

Problems:
- Unable to complete the story development in time constraint (one week)
- Not enough images in static folder, causing broken image link due to python `randint()` function
- Unable to generate enough images to randomise each location on load
- Did not import images table (for ID, text prompts used, and filename location)
- Hero class structure not utilised in story
- Page for death by running out of HP not accessible
- Game over page not completed

Future:
- Having the natural narrative select keyword prompts for live AI-generative art
- Complete story in entirety
- Reward users for completing story using smart contract

More time than necessary was dedicated to the story structure, which in itself, was a difficult undertaking. 
![flowchart](/Flowchart.jpg)

It would be interesting to try and using AI-generation for the narrative. Due to the lack of free instant AI text-to-image APIs, each image was manually generated with a string of prompts that I deemed suitable for the location narrative. These images were generated using [Synthia](https://meetsynthia.co), developed by bit_FLIP#2945, which currently works as a Discord bot that is able to AI-generate images and text via user prompts to alarmingly accurate degree.