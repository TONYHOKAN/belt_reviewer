class CommentsController < ApplicationController
  def create
    event_id=params[:event_id]
    @comment = Comment.new(:user_id => session[:user_id], :event_id => event_id, :comment => params[:comment])
    @comment.save
    redirect_to url_for(:controller => :events, :action => :show, :id => event_id)
  end
end

