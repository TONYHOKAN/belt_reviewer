class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thanks"
    else
      flash[:user] = @user
      flash[:error] = true
      flash[:error_count] = @user.errors.count
      flash[:full_error_messages] = @user.errors.full_messages
      redirect_to url_for(:controller => :home_page, :action => :index)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
