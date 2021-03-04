class UsersController < ApplicationController
  before_action :verify_user,only: [:show]
  def index
    @users = User.all
  end

  def new
  
  end
  def create
    @user = User.create(user_params)
    redirect_to '/sessions/new'
  end
  def show 
    @user = User.find(params[:id])
    @secrets = @user.secrets
    @secrets_liked = @user.secrets_liked
    
  end
  def edit
    @user = User.find(params[:id])
    
  end

  def update
    @user = User.find(params[:id])
    
  end

  def delete
    @user = User.find(params[:id])
  end
    def verify_user
    redirect_to'/'  unless(params[:id].to_i == session[:user_id])
  end
      
    
  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
    
  end
end
