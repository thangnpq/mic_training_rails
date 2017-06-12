class HomeController < ApplicationController
  def search
      @articles = Article.search(params[:search])
  end
end