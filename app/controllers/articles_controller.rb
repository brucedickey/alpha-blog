# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
    # byebug   # Pauses at debug console
    # render plain: "In show()"

    # @article = Article.find(params[:id])
  end

  def index
    # @articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article]   # DEBUG, Sends to browser
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      flash[:notice] = "Article was created successfully"
      # redirect_to article_path(@article)
      redirect_to @article # The shortcut way
    else
      render "new"
    end
  end

  def update
    # @article = Article.find(params[:id])
    # if @article.update(params.require(:article).permit(:title, :description))

    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    # @article = Article.find(params[:id])

    @article.destroy
    redirect_to articles_path
  end

  # Place `private` near the bottom -- all methods AFTER it are private.
  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    return unless (current_user != @article.user) && !current_user.admin?

    flash[:danger] = "You can only edit or delete your own articles"
    redirect_to root_path
  end
end
