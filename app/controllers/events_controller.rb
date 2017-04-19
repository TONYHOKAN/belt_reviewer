class EventsController < ApplicationController
  def index
    @events_same_state = Event.find_same_state(find_session_user.state)
    @events_not_same_state = Event.find_not_same_state(find_session_user.state)

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
    @comment_string = event_comments
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

  def find_session_user
    User.find(session[:user_id])
  end

  def event_comments
    comment_string=""
    @event.comments.each do |comment|
      comment_string += comment.user.first_name + " says: " + comment.comment + "\n"
      comment_string += "---------------------------\n"
    end
    comment_string
  end
end
