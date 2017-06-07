class ArticlesController < ApplicationController

  USERS = {"eric" => "123"}
  before_action :authenticate, only: [:destroy]
  def index
    @article = Article.all
  end
  def new
    @article = Article.new
  end
  def create
      @article = Article.new(article_params)
     if @article.save
      redirect_to @article
     else
      render 'new'
      end
  end
  def show
    @article= Article.find(params[:id])
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
        redirect_to @article, alert: "Update is successfully!"
    else
      render 'edit'
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path, alert: "Delete is successfully!"
  end
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
    def authenticate
       authenticate_or_request_with_http_digest do |username|
        USERS[username]
      end
    end
end
