module ApplicationHelper
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def is_user_joined_event?(user_id, event_id)
    Registration.find_by(user_id:user_id, event_id:event_id)
  end
end
