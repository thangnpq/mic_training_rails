class UpdateNilDataForArticles < ActiveRecord::Migration[5.1]
  def change
    list_articles = Article.where(user_id = nil)

    list_articles.each do |article|
        article.user = User.first
        article.save
    end
  end
end
