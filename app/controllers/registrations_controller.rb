class RegistrationsController < ApplicationController
  def new
    Registration.new(:user_id => session[:user_id], :event_id => params[:event_id]).save
    redirect_to url_for(:controller => :events, :action => :index)
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy
    redirect_to url_for(:controller => :events, :action => :index)
  end
end
