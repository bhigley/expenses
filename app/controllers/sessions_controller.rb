class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new
    # Render the login form
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.password = params[:session][:password]
      log_in user
      redirect_to user
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
