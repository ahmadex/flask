from datetime import datetime
from flask import Flask, render_template, url_for, flash, redirect
from forms import RegistartionForm, LoginForm
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SECRET_KEY'] = '3e31c0e45a58a1ca84f83a22267335ec'
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///site.db'
db = SQLAlchemy(app)


class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(20), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password = db.Column(db.String(60), nullable=False)
    image_file = db.Column(db.String(60), nullable=False, default='default.jpeg')
    posts = db.relationship('Post', backref='author', lazy=True)

    def __repr__(self):
        return f"User('{self.id}','{self.username}','{self.email}')"


class Post(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(50), nullable=False, unique=True)
    body = db.Column(db.Text, nullable=False)
    created = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)

    def __repr__(self):
        return f"Post('{self.id}','{self.title}','{self.created}')"



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

if __name__ == '__main__':
    app.run(debug=True)