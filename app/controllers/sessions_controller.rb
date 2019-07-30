class SessionsController < ApplicationController
    skip_before_action :redirect_if_not_logged_in

    def index
    end

    def new
    end

    def create
        if  @user = User.find_by(email: params[:user][:email])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id 
                redirect_to user_path(@user)
            else
                flash[:message] = "Incorrect email or password"
                redirect_to login_path
            end

       else @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            #u.image = auth['info']['image']
          end
            session[:user_id] = @user.id
            redirect_to user_path(@user)

        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    private
 
    def auth
      request.env['omniauth.auth']
    end


end