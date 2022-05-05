from flask import Flask, request, session, redirect, render_template
from sql_functions import sql_write, sql_fetch
import psycopg2
import os
import requests
import bcrypt
DATABASE_URL = os.environ.get('DATABASE_URL', 'dbname=mbgame')
SECRET_KEY = os.environ.get('SECRET_KEY', 'pretend secret key for testing')

app = Flask(__name__)
app.config['SECRET_KEY'] = SECRET_KEY

@app.route('/')
def index():
    return render_template('index.html', name=session.get('t_name'))

@app.route('/newgame')
def register():
    return render_template('register.html')

@app.route('/newgame', methods=['POST'])
def register_action():
    t_name = request.form.get('t_name')
    email = request.form.get('email')
    password = request.form.get('password')
    password_hash = bcrypt.hashpw(password.encode(), bcrypt.gensalt()).decode()

    sql_write('INSERT INTO players (email, password_hash, name) VALUES (%s, %s, %s)', [email, password_hash, t_name])
    session['t_name'] = t_name
    return redirect('/choose_hero')

@app.route('/loadgame')
def loadgame():
    return render_template('login.html')
    # name = session.get('name')
    # id = session.get('id')
    # if not name:
    #     return render_template('login.html')
    # else:
    #     conn = psycopg2.connect('dbname=mbgame')
    #     cur = conn.cursor()
    #     cur.execute('SELECT * FROM heroes INNER JOIN players ON heroes.hero_id = players.id WHERE hero_id = %s', [id])
    #     heroes = cur.fetchall()
    #     return render_template('heroes.html', heroes=heroes)

@app.route('/load', methods=['POST'])
def load():
    email = request.form.get('email')
    session['email'] = email
    password = request.form.get('password')

    if not email:
        session.clear()
        return '''Details Invalid! <a href='/loadgame'>Go Back</a>'''
    else:
        results = sql_fetch('SELECT id, name, password_hash FROM players WHERE email = %s', [email])
    
        if not results:
            session.clear()
            return '''Details Invalid! <a href='/loadgame'>Go Back</a>'''
        else: 
            p_id = results[0][0]
            session['p_id'] = p_id
            # t_name = results[0][1]
            password_hash = results[0][2]
            valid = bcrypt.checkpw(password.encode(), password_hash.encode())
            # results = sql_fetch('SELECT location_id FROM heroes WHERE hero_id = %s', [p_id])
            # load_state = results[0][0]
            
            if not valid:
                session.clear()
                return '''Wrong Password. <a href='/loadgame'>Go Back</a>'''
            else:
                return redirect('/choose_hero')

@app.route('/choose_hero')
def choose_hero():
    p_id = session.get('p_id')
    # print(p_id)
    # need to replace mbgame with DATABASE_URL
    if p_id != None:
        # email = session.get('email')
        results = sql_fetch('SELECT * FROM heroes INNER JOIN players ON heroes.p_id = players.id WHERE players.id = %s', [p_id])
        # print(results)
        hero_id = results[0][0]
        session['hero_id'] = hero_id
        location = sql_fetch('SELECT name FROM locations INNER JOIN heroes ON locations.id = heroes.location_id WHERE heroes.id = %s', [hero_id])
        location = location[0][0]
        return render_template('heroes.html', heroes=results, location=location, p_id=p_id)
        # return redirect('/loadgame')
    elif p_id == None: 
        t_name = session.get('t_name')
        results = sql_fetch('SELECT * FROM players WHERE name = %s', [t_name])
        p_id = results[0][0]
        session['p_id'] = p_id
        return render_template('heroes.html')

@app.route('/create_hero', methods=['POST'])
def create_hero():
    hero_name = request.form.get('hero_name')
    hero_class = request.form.get('hero_class')
    p_id = session.get('p_id')
    class_stats = sql_fetch('SELECT * FROM classes WHERE hero_class = %s', [hero_class])
    for stats in class_stats:
        atk = stats[1]
        hp = stats[2]
        mp = stats[3]
    sql_write('INSERT INTO heroes (p_id, hero_name, hero_class, hero_atk, hero_hp, hero_mp, location_id) VALUES (%s, %s, %s, %s, %s, %s, 1)', [p_id, hero_name, hero_class, atk, hp, mp])
    results = sql_fetch('SELECT id FROM heroes WHERE p_id = %s', [p_id])
    hero_id = results[0][0]
    session['hero_id'] = hero_id
    return redirect('/choose_hero')

@app.route('/load_hero', methods=['POST'])
def load_hero():
    hero_id = request.form.get('id')
    hero_stats = sql_fetch('SELECT * FROM heroes WHERE id = %s', [hero_id])
    # for stats in hero_stats:
    #     hero_class = stats[3]
    #     hero_atk = stats[4]
    #     hero_hp = stats[5]
    #     hero_mp = stats[6]
    #     location = stats[7]
    loc_num = hero_stats[0][7]
    return redirect(f'/location/{loc_num}')

@app.route('/location/<loc_num>')
def location(loc_num):
    # updating loc_num
    hero_id = session.get('hero_id')
    hero_stats = sql_fetch('SELECT * FROM heroes WHERE id = %s', [hero_id])
    sql_write('UPDATE heroes SET location_id = %s WHERE id = %s', [loc_num, hero_id])

    # appointing plot 
    results = sql_fetch('SELECT * FROM locations WHERE id = %s', [loc_num])
    for result in results:
        loc_name = result[1]
        plot = result[2]
        c1 = result[3]
        c2 = result[4]
        c3 = result[5]

    # choice tree
    movements = sql_fetch('SELECT m1, m2, m3 FROM locations WHERE id = %s', [loc_num])
    # print(movements)
    for move in movements:
        m1 = move[0]
        if move[1]:
            m2 = move[1]
        if move[2]:
            m3 = move[2]
            return render_template('location.html', loc_name=loc_name, plot=plot, stats=hero_stats, m1=m1, m2=m2, m3=m3, c1=c1, c2=c2, c3=c3, results=results)
        
        else:
            results = sql_fetch('SELECT * FROM locations WHERE id = %s', [loc_num])
            for result in results:
                loc_name = result[1]
                plot = result[2]
            return render_template('location.html', loc_name=loc_name, plot=plot, stats=hero_stats, m1=m1, m2=m2, c1=c1, c2=c2, results=results)
       

@app.route('/exit')
def exit():
    session.clear()
    return redirect ('/')

if __name__ == '__main__':
    app.run(debug=True)