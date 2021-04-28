from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from flask_login import LoginManager
from flask_mail import Mail
from flask_migrate import Migrate, MigrateCommand
from flask_script import Manager


app = Flask(__name__)
app.config['SECRET_KEY'] = '3e31c0e45a58a1ca84f83a22267335ec'

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://ahmadex:test123@localhost:5432/flask_db'

db = SQLAlchemy(app)

bcrypt = Bcrypt(app)

login_manager = LoginManager(app)
login_manager.login_view = 'login'
login_manager.login_message_category = "info"

app.config['MAIL_SERVER'] = 'smtp.googlemail.com'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USE_TLS'] = True
app.config['MAIL_USERNAME'] = 'ahmad.srk1998@gmail.com'
app.config['MAIL_PASSWORD'] = 'Shazam@1998'
mail = Mail(app)

migrate = Migrate(app, db)
manager = Manager(app)

manager.add_command('db', MigrateCommand)

from flaskblog import routes