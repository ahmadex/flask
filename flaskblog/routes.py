import secrets
import os 
from PIL import Image
from flask import render_template, url_for, flash, redirect, request, abort
from wtforms.validators import ValidationError
from flaskblog.models import User, Post, Comment
from flaskblog.forms import (RegistartionForm, LoginForm, UpdateAccountForm,
                             PostForm, RequestTokenForm, ResetPasswordForm, 
                             CommentForm)
from flaskblog import app, db, bcrypt, mail
from flask_login import login_user, logout_user, current_user, login_required
from flask_mail import Message
from datetime import datetime

@app.route("/")
def index():
    page = request.args.get('page',1, type=int)
    posts = Post.query.order_by(Post.created.desc()).paginate(page=page, per_page=4)
    return render_template('home.html', post=posts)


@app.route("/about")
def about():
    return render_template('about.html', posts=posts)


@app.route("/register", methods = ['GET', 'POST'])
def register():
    if current_user.is_authenticated:
        return redirect(url_for('index'))

    form = RegistartionForm()
    if form.validate_on_submit():
        hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        user = User(username=form.username.data, email=form.email.data, password=hashed_password)

        db.session.add(user)
        db.session.commit()
        login_user(user, remember=False)
        flash(f'Account has been created for {form.username.data}', 'success')
        return redirect(url_for('account'))

    return render_template('register.html', form=form)


@app.route("/login", methods=['GET','POST'])
def login():
    if current_user.is_authenticated:
        return redirect(url_for('index'))

    form = LoginForm()
    if form.validate_on_submit():
        user = User.query.filter_by(email=form.email.data).first()
        if user and bcrypt.check_password_hash(user.password,form.password.data):
            login_user(user, remember=form.remember.data)
            next_page = request.args.get('next')
            if next_page:
                return redirect(next_page)
            else:
                return redirect(url_for('index'))
        flash('Email or Username is Incrrect','danger')
    return render_template('login.html', form=form)


@app.route("/logout")
def logout():
    logout_user()
    return redirect(url_for('login'))

def save_picture(form_picture):
    random_hex_name = secrets.token_hex(8)
    _, f_extension = os.path.splitext(form_picture.filename)
    picture_name = random_hex_name + f_extension
    picture_path = os.path.join(app.root_path, 'static/images', picture_name)
    
    # optional (for image resize befor save)
    output_size = (125, 125)
    i = Image.open(form_picture)
    i.thumbnail(output_size)
    i.save(picture_path)

    # form_picture.save(picture_path)
    return picture_name


@app.route("/account", methods=['GET','POST'])
@login_required
def account():
    form = UpdateAccountForm()
    if form.validate_on_submit():

        if form.image_file.data:
            picture_file = save_picture(form.image_file.data)
            current_user.image_file = picture_file
         
        current_user.username = form.username.data
        current_user.email = form.email.data
        db.session.commit()
        flash('User Account Updates', 'success')
        return redirect(url_for('account'))
    elif request.method == 'GET':
        form.username.data = current_user.username
        form.email.data = current_user.email
        
    # image_file = url_for('static', filename='/images/' + current_user.image_file)
    return render_template('account.html', form=form)


@app.route("/new_post", methods=['GET','POST'])
def new_post():
    form = PostForm()
    if form.validate_on_submit():
        post = Post(title=form.title.data, body=form.body.data, author=current_user)
        db.session.add(post)
        db.session.commit()
        flash('Your Post has been Created', 'success')
        return redirect(url_for('index'))
    return render_template('new_post.html',form=form)


@app.route("/post_detail/<int:pk>", methods=["GET","POST"])
def post_detail(pk):
    post = Post.query.get_or_404(pk)
    comments = Comment.query.filter_by(post_id=post.id).order_by(Comment.created.desc()).all()
    form = CommentForm()

    if form.validate_on_submit():
        comment = Comment(body=form.body.data, user=current_user, post=post)
        db.session.add(comment)
        db.session.commit()
        flash('Comment is Added','success')
        return redirect(url_for("post_detail", pk=post.id))
    return render_template('post_detail.html',post=post, form=form, comments=comments)


@app.route("/post_update/<int:pk>", methods=["GET","POST"])
@login_required
def post_update(pk):
    post = Post.query.get_or_404(pk)
    if post.author != current_user:
        abort(403)
    form = PostForm()
    if form.validate_on_submit():
        post.title = form.title.data
        post.body = form.body.data
        post.updated = datetime.utcnow()
        db.session.add(post)
        db.session.commit()
        flash('Post had been Updated', 'success')
        return redirect(url_for('post_detail',pk=post.id))
    
    elif request.method == 'GET':
        form.title.data = post.title
        form.body.data = post.body
    
    return render_template('new_post.html',update='Update', form=form)


@app.route("/post_delete/<int:pk>", methods=["POST"])
def post_delete(pk):
    post = Post.query.get_or_404(pk)
    if post.author != current_user:
        abort(403)

    db.session.delete(post)
    db.session.commit()
    flash('Post has been Deleted', 'success')
    return redirect(url_for('index'))


@app.route("/user_posts/<string:username>")
def user_posts(username):
    page = request.args.get('page',1,type=int)
    user = User.query.filter_by(username=username).first_or_404()
    posts = Post.query.filter_by(author=user)\
        .order_by(Post.created.desc())\
        .paginate(page=page, per_page=4)

    return render_template('user_posts.html', post=posts, user=user)

def send_reset_email(user):
    token = user.get_reset_token()
    msg = Message('Password Reset Link',sender='ahmad.srk1998@gamil.com', recipients=[user.email])
    msg.body = f'''To reset ur Password, visit following link

    {url_for('reset_password', token=token, _external=True)} 
    
    If u didn't make this request then simply ignore this
    '''

    mail.send(msg)

@app.route("/request_token/", methods=['GET','POST'])
def request_token():
    if current_user.is_authenticated:
        return redirect(url_for('index'))
    
    form = RequestTokenForm()
    if form.validate_on_submit():
        user = User.query.filter_by(email=form.email.data).first()
        send_reset_email(user)
        flash('An Email has been sent to your Email','Info')
        return redirect(url_for('login'))

    return render_template('request_token.html', form=form)


@app.route("/reset_password/<token>", methods=['GET','POST'])
def reset_password(token):
    
    user = User.verify_reset_token(token)
    print('user-reset_pasword', user)
    if user is None:
        flash('Token is invalid or has been Expire', 'danger')
        return redirect(url_for('request_token'))
    
    form = ResetPasswordForm()
    if form.validate_on_submit():
        hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        print('passwprd', form.password.data)
        user.password = hashed_password
        db.session.commit()
        flash('Password has been Updated','success')
        return redirect(url_for('login'))

    return render_template('reset_password.html',form=form)

