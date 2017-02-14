require 'sinatra'
require 'active_record'
require 'sinatra/activerecord'
require 'sqlite3'
require './models'

set :database, "sqlite3:wdi.db"

## To do: Add Our Application Routes
get '/' do
  @users = User.all
  erb :home
end