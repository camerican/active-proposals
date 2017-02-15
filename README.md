## Getting Started Steps

First, let's touch out the files that we'll need to get going.

```
touch Gemfile Rakefile app.rb models.rb
mkdir public views
```

Then set up your Gemfile with relevant Gems.

```
# Gemfile
source "http://rubygems.org"

gem "sinatra"
gem "sinatra-activerecord"
gem "sqlite3"
gem "rake"
```

Now we'll get our main application file going with some base code.

```
# app.rb
require 'sinatra'
require 'active_record'
require 'sinatra/activerecord'
require 'sqlite3'
require './models'

set :database, "sqlite3:wdi.db"
```

Above, we're setting the database configuration to refer to a sqlite3 database named wdi.db.

Next let's configure our Rakefile so we can run rake commands using our program.

```
# Rakefile
require 'sinatra/activerecord/rake'
require './app'
```

Now we can create some migrations to get going:

```
rake db:create_migration NAME=create_users_table
rake db:create_migration NAME=create_proposals_table
```


# User Logins

We'll need a form with a username and password to check.  We'll set up a POST route to recieve this data, which will come through the params hash.

```html
<form method="POST" action="/login">
	<fieldset>
		<legend>Login</legend>
		<label for="user">User</label>
		<input name="user" /><br />
		<label for="pass">Pass</label>
		<input type="password" name="password" /><br />
		<input type="submit" value="Login" />
	</fieldset>
</form>
```

We can receive the above data at `post '/login'`.

```
post '/login' do
  puts "My login data: " + params.inspect
  params.inspect
end
```

## Database Setup 

To set-up your database and get the seeds inserted, we can run the following commands.

```
rake db:migrate
rake db:seed
```

