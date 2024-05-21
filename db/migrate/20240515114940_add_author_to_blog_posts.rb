class AddAuthorToBlogPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :blog_posts, :user, null: false, foreign_key: true, default: 1
  end
end
