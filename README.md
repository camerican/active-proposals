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



