class UsersController < ApplicationController
  # this is a GET action
  # all it does is load a view page (template) with a form that needs to be filled out
  def new
    @user = User.new
  end
  # this is a POST action
  # something is happening behind the scenes
  # this will change our database in some way
  # BUT it WILL NOT require a view page
  # in order to show a page (and avoid error) we redirect to a GET action
  def create
    @user = User.new(fname: params[:user][:fname], lname: params[:user][:lname], username: params[:user][:username], password: params[:user][:password], email: params[:user][:email])
    if @user.save
      flash[:notice] = "You are now part of the club!!"
      redirect_to root_path
    
    else
      flash[:notice] = "There was an error creating your account."
    end
  end

  def index
    @users = User.all 
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
  # this is a DELETE action
  # something is happening behind the scenes
  # this will change our database in some way
  # BUT it WILL NOT require a view page
  # in order to show a page (and avoid error) we redirect to a GET action
  def destroy
   @user = User.find(params[:id])
   if @user.destroy
     flash[:notice] = "User was deleted"
   else 
     flash[:alert] = "error"
   end
     redirect_to users_path
   end

  # this is a GET action
  # all it does is load a view page (template) with a form that needs to be filled out
  def edit
    @user = User.find(params[:id])
  end
  # this is a PATCH/PUT action
  # something is happening behind the scenes
  # this will change our database in some way
  # BUT it WILL NOT require a view page
  # in order to show a page (and avoid error) we redirect to a GET action
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :fname, :lname, :email, :password)
  end 

end
