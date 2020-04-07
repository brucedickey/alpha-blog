class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy] 

    def show
        #byebug   # Pauses at debug console 
        #render plain: "In show()"

        #@article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
        #@article = Article.find(params[:id])
    end

    def create
        #render plain: params[:article]   # Sends to browser
        #@article = Article.new(params.require(:article).permit(:title, :description))

        @article = Article.new(article_params)

        # FIXME this is temporary, prior to having auth implemented
        @article.user = User.first

        if @article.save
           flash[:notice] = "Article was created successfully" 
           #redirect_to article_path(@article)
           redirect_to @article                 # The shortcut way
        else
            render 'new'
        end
    end

    def update
        #@article = Article.find(params[:id])
        #if @article.update(params.require(:article).permit(:title, :description))

        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully"
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        #@article = Article.find(params[:id])

        @article.destroy
        redirect_to articles_path
    end

    # Place `private` near the bottom -- all methods AFTER it are private.
    private 

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
       params.require(:article).permit(:title, :description)
    end
end
