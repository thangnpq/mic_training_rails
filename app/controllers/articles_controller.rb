class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    @articles = Article.all.order("created_at DESC")

  end

  def new
    @article = Article.new

  end

  def create
      @article = Article.new(article_params)
      @article.user = current_user

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
    params.require(:article).permit(:title, :text, :image)
  end
end
