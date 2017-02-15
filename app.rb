require 'sinatra'
require 'active_record'
require 'sinatra/activerecord'
require 'sqlite3'
require 'sinatra/flash'
require './models'

set :database, "sqlite3:wdi.db"

enable :sessions  # enable sessions

before do 
  current_user
end

get '/' do
  @users = User.all
  
  p @current_user
  erb :home
end

get '/logout' do
  session.destroy
  flash[:notice] = "You are now logged out"
  redirect '/'
end

get '/proposal/create' do
  if @current_user
    erb 'proposal/create'.to_sym
  else
    redirect '/'
  end
end

post '/proposal/create' do
  if @current_user
     Proposal.create( name: params[:name], creator_id: @current_user.id, status: "pending" )
    flash[:notice] = "Yay, nice proposal"
   else
    error do
      "You are not logged in, you bad person, you"
    end
   end
   redirect '/proposal/create'
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

def current_user
  if session[:user_id]
    @current_user = User.find(session[:user_id])
    # just like:
    # User.where("id = '#{session[:user_id]}'")
  end
end







