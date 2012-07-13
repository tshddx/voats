class HomeController < ApplicationController
  def index
    render :text => @user.present? ? @user.cookie : "No user"
  end
end
