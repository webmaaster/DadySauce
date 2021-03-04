class SessionsController < ApplicationController
    before_action :say_goodbye, only: [:destroy]
    skip_before_action :say_hello
    def new
        render 'sessions/new'
    end
    def create
        user = User.find_by(email:params[:user][:email])
        if user
            puts 'user found'
            if user.authenticate(params[:user][:password]) 
                session[:user_id] =user.id
                redirect_to user_path(user)
        
            else 
            puts 'password wrong'
                flash[:errors] = ["login failed"]
                redirect_to '/'
                
            end
            else 
            flash[:erros] = ['login failed']
            redirect_to '/sessions/new'
        end
    end

    def delete
    session[:user_id] = nil
    redirect_to '/sessions/new'
    end

    def say_goodbye
        say_goodbye
    end
end