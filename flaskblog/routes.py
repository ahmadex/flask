from flask import render_template, url_for, flash, redirect
from flaskblog.models import User, Post
from flaskblog.forms import RegistartionForm, LoginForm
from flaskblog import app

posts = [
    {
        'name':'Ahmad',
        'age':21,
        'salary':15000,
        'job':'python developer'
    },  
    {
        'name':'Ashmayra',
        'age':23,
        'salary':15000,
        'job':'ruby developer'
        
    },
    {
        'name':'Abbas',
        'age':21,
        'salary':15000,
        'job':'python developer'
    },
    {
        'name':'Bruce Wayne',
        'age':42,
        'salary':1255623565000,
        'job':'Batman'
    }

]

@app.route("/")
def index():
    return render_template('home.html', posts=posts)

@app.route("/about")
def about():
    return render_template('about.html', posts=posts)


@app.route("/register", methods = ['GET', 'POST'])
def register():
    form = RegistartionForm()

    if form.validate_on_submit():
     
        flash(f'Account is created for {form.username.data}', 'success')
        return redirect(url_for('index'))

    return render_template('register.html', form=form)

@app.route("/login", methods=['GET','POST'])
def login():
    form = LoginForm()

    if form.validate_on_submit():
        flash(f'Welcome {form.email.data}','success')
        return redirect(url_for('index'))
    return render_template('login.html', form=form)