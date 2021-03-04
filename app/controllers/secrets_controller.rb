class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
  end

  def new
    @secrets = Secret.all
  end

  def show
    @secrets = Secret.find(params[:id])
    
    redirect_to '/secrets/:id'
  end
  def create
    @secret = Secret.create(secret_params)
    @secret.user = current_user
    if @secret.save
        flash[:notice] = ["successfully created secret"]
        redirect_to '/secrets/new'
    end
    flash[:errors] = @secret.errors.full_messages
    
  end
  def delete
    @secrets  = Secret.find(params[:id])
    @secrets.delete if @secrets.user == current_user
    redirect_to '/secrets/new'
  end
  private
  def secret_params
    params.require(:secret).permit(:content,:user_id)
  end
end
