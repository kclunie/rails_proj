class AttendsController < ApplicationController

    def new
        @attend = Attend.new
        #@attend.build_user
    end

    def create
        @event = Event.find(attends_params[:event_id])
        @user = User.find(session[:user_id])
        @attend = Attend.create(attends_params)
        #flash[:message] = @ride.take_ride
        redirect_to user_path(@user)
    end

    private

    def attends_params
      params.require(:attend).permit(
         :user_id,
         :event_id,
         :guest,
         user_attributes:[:name, :age, :email, :password]
      )
    end

end
