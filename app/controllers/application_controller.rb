class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter do
    if cookies[:user].present?
      @user = User.find_by_cookie(cookies[:user])
    end
    
    if @user.nil?
      @user = User.create!
    end

    cookies[:user] = @user.cookie
  end
end
