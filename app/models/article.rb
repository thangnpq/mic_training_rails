class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,length: { minimum: 5 }
  self.locking_column = :lock_article_column
end
