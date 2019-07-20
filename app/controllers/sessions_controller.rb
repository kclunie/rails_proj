class SessionsController < ApplicationController

    def index
    end

    def new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            flash[:message] = "Incorrect email or password"
            redirect_to login_path
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end




end