require 'sinatra'
require 'active_record'
require 'sinatra/activerecord'
require 'sqlite3'
require 'sinatra/flash'
require './models'

set :database, "sqlite3:wdi.db"

enable :sessions  # enable sessions

get '/' do
  @users = User.all
  @current_user = session[:user_id] && User.find(session[:user_id])
  p @current_user
  erb :home
end

get '/logout' do
  session.destroy
  flash[:notice] = "You are now logged out"
  redirect '/'
end

post '/login' do
  @user = User.where("username = '#{params[:user]}'").first

  p params

  if @user && @user.password == params[:pass]
   # "WELCOME #{@user.fname}!"
    session[:user_id] = @user.id
    flash[:notice] = "You successfully logged in!"
  else
    flash[:notice] = "YOU ARE AN IMPOSTER"
  end
  redirect '/'
  # @username = "Camerican"
  # @password = "FluffyBunny"

  # puts "My login data: " + params.inspect
  # params.inspect
end

# def current_user
#   if session[:user_id]
#     @current_user = User.find(session[:user_id])
#     # just like:
#     # User.where("id = '#{session[:user_id]}'")
#   end
# end







