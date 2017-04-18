class EventsController < ApplicationController
  def index
    @events = Event.all
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = User.find(session[:user_id])
    if !@event.save
      error_message
    end
    redirect_to index
  end

  def show
    @event = Event.find(params[:id])
    @joined_users = @event.joined_users
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to index
  end
  private
  def event_params
    params.require(:event).permit(:name, :date, :location, :state)
  end

  def error_message
    flash[:event] = @event
    flash[:error] = true
    flash[:error_count] = @event.errors.count
    flash[:full_error_messages] = @event.errors.full_messages
  end
end
