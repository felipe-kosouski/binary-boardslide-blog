class AddCategoriesToBlogPost < ActiveRecord::Migration[7.1]
  def change
    add_reference :blog_posts, :category, null: false, foreign_key: true
  end
end
