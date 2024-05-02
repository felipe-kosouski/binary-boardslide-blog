class Category < ApplicationRecord
  validates :name, presence: true

  has_many :blog_posts

  # Remove tags from the category
end
