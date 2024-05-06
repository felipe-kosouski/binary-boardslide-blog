class Category < ApplicationRecord
  validates :name, presence: true

  has_many :blog_posts
end
