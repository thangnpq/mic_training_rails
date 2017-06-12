class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,length: { minimum: 5 }
  self.locking_column = :lock_article_column
  belongs_to :user
  has_attached_file :image, styles: { medium: "250x250>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  def self.search search
    where("title ILIKE :search OR text ILIKE :search", search: "%#{search}%")
  end
end
