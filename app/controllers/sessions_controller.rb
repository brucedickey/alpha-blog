# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    # Log in
    user = User.find_by(email: params[:session][:email].downcase)

    if user&.authenticate(params[:session][:password])
      # Sessions
      # https://guides.rubyonrails.org/action_controller_overview.html#session
      session[:user_id] = user.id

      flash[:success] = "Logged in successfully"
      redirect_to user
    else
      flash.now[:warning] = "You entered an incorrect email or password"
      render "new"
    end
  end

  def destroy
    # Log out
    @current_user = nil
    session[:user_id] = nil
    flash[:success] = "Logged out"
    redirect_to root_path
  end
end
