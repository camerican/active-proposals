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

###################################
## User Sign Up
##
## * GET /sign-up  - form for sign-up
## * POST /sign-up  - handle submission

get '/sign-up' do
  erb 'sign-up'.to_sym
end

post '/sign-up' do
  # based on how the form was labeled, we're receiving data in the following fields:
  # params[:name_first] -> fname
  # params[:name_last] -> lname
  # params[:username] -> username
  # params[:password] -> password

  # while we *could* have named the 
  # fields exactly the same as we
  # have the columns labeled in our database
  # this is an example where fname and
  # lname are coming in from a differently
  # named form field...  We can use map
  # to reformat the data the way we need

  # Let's create a hash to transform the fields (this is just an example)
  translate = {
    name_first: :fname,
    name_last: :lname,
    username: :username,
    password: :password
  }
  @user = User.create translate.map do |params_key,db_key|
    db_key => params[params_key]
  end 
  # let's check to see whether we were able
  # to create the user successfully
  # because we are enforcing 
  


  # HARD DELETE EXAMPLE
  # @user.posts.delete_all
  # @user.posts.each do |post|
  #   post.delete
  # end
  # @user.delete

end


###################################
## User Login / Logout

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

get '/logout' do
  session.destroy
  flash[:notice] = "You are now logged out"
  redirect '/'
end

###################################
## Proposals

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



def current_user
  if session[:user_id]
    @current_user = User.find(session[:user_id])
    # just like:
    # User.where("id = '#{session[:user_id]}'")
  end
end







