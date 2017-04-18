class SessionsController < ApplicationController
  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:error] = true
      flash[:error_count] = 1
      flash[:full_error_messages] = ["Invalid email/password!"]
      redirect_to url_for(:controller => :home_page, :action => :index)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
