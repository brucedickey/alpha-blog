# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :require_logged_in, only: [:edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def new
    @user = User.new
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account information was successfully updated"
      redirect_to @user # Short for @user.path
    else
      render "edit"
    end
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    @user.destroy
    flash[:success] = "User and all articles created by user have been deleted"
    redirect_to users_path
  end

  def index
    # @users = User.all
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Sign in the user upon sign-up success:
      session[:user_id] = @user.id

      flash[:success] =
        "Welcome to the Alpha Blog, #{@user.username}, you have successfully signed up."
      redirect_to user_path(@user)   # User's index.html.erb page
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_logged_in
    if current_user.nil?
      flash[:warning] = "Please log in to edit your account"
      redirect_to root_path
    end
  end

  def require_same_user
    return unless (current_user != @user) && !current_user.admin?

    flash[:warning] = "You can only edit your own account"
    redirect_to root_path
  end

  def require_admin
    return if current_user.admin?

    flash[:warning] = "Only admin users can perform that action"
    redirect_to root_path
  end
end
