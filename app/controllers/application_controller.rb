class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :require_login  # Apply require_login filter to all controllers

  private

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this page."
      redirect_to login_path  # Adjust this path to your login route
    end
  end
end
