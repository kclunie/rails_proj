class AttendsController < ApplicationController

    def index
        if params[:event_id] && event = Event.find_by_id(params[:event_id])
            #@attends = current_user.attends.by_event(params[:event_id])
            @attends = event.attends
        else
            @attends = current_user.attends
            #could be @attends = Attends.all
        end
    end
    
    def new
        @event = Event.find_by(id: params[:event_id])
        @user = User.find(session[:user_id])
        #binding.pry
        if params[:event_id] && event = Event.find_by_id(params[:event_id])
            @attend = event.attends.build 
        else
        @attend = Attend.new
        #@attend.build_user
        end 
    end

    def create
        @event = Event.find(attends_params[:event_id])
        @user = User.find(session[:user_id])
        @attend = Attend.create(attends_params)
        
        if @attend.save
            # binding.pry
            redirect_to events_path
           
         else
            flash[:message] = "Guest cannot be blank or you have already RSVPd!"
            redirect_to new_event_attend_path(@event)

        # redirect_to user_path(@user)
          end
    end

    private

    def attends_params
      params.require(:attend).permit(
         :user_id,
         :event_id,
         :guest,
         #user_attributes:[:name, :age, :email, :password]
      )
    end

end
