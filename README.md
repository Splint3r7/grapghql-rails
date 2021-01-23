# grapghql-rails

## Rails app setup:

```
$ rvm install "ruby-2.4.6" or $ rbenv install 2.4.6## You can update rails by running 
$ gem update rails
```

Create new rails project

```
$ rails new todo-app --database=postgresql 
$ cd todo-app
```

Add graphql to your gem file.

```
# Gemfile 
$ vi Gemfile
gem 'graphql'
```

Install gems using bundle

```
$ bundle install
```

Install webpacker

```
rails webpacker:intsall
```

if you get sprockets error add these two lines into your `app/assets/config/manifest.js`

```
//= link graphiql/rails/application.css
//= link graphiql/rails/application.js
```

Create file and folders for graphql:

```
$ rails generate graphql:install
```

setup your postgresql database in file `config/database.yml`. Replace username and password with blank if you have not setup any credentials.

```
development: <<: *default 
database: todo_app_development 
username: YOUR_POSTGRES_USERNAME 
password: YOUR_POSTGRES_PASSWORDtest: <<: *default 

database: todo_app_development 
username: YOUR_POSTGRES_USERNAME 
password: YOUR_POSTGRES_PASSWORD
```

Create databse

```
rails db:create
```

Start rails server

```
rails s
```
