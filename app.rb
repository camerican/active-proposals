require 'sinatra'
require 'active_record'
require 'sinatra/activerecord'
require 'sqlite3'
require './models'

set :database, "sqlite3:wdi.db"

get '/' do
  @users = User.all
  erb :home
end

post '/login' do
  @user = User.where("username = '#{params[:user]}'").first

  p params

  if @user.password == params[:pass]
    "WELCOME #{@user.fname}!"
  else
    "YOU ARE AN IMPOSTER"
  end

  # @username = "Camerican"
  # @password = "FluffyBunny"

  # puts "My login data: " + params.inspect
  # params.inspect
end



