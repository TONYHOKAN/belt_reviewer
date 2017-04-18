class HomePageController < ApplicationController
  def index
    @user = User.new
  end
end
