class EventsController < ApplicationController

    before_action :set_event, only: [:show]

    def index
       # if params[:user_id]
        #    @events = User.find(params[:user_id]).events
         # else
        @events = Event.order_by_date
        
    #end
    end

    def new
        @event = Event.new
    end
    
    def create
        @event = Event.new(event_params)
        if @event.save
         redirect_to events_path
        else
         render :new
        end 
    end

    def popular_event
        @events = Event.popular_event
    end

    def show
       # @event = Event.find_by(id: params[:id])
        @attend = Attend.new
        @attend.build_user
        @user = User.find(session[:user_id])

        #@attends = Attend.all

    end

    def popular_events

    end

    private

    def event_params
        params.require(:event).permit(:name, :date, :location, :details)
    end

    def set_event
        @event = Event.find_by(id: params[:id])
        redirect_to events_path if !@event  
    end


end
