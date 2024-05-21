class RenameBlogPostsUserColumn < ActiveRecord::Migration[7.1]
  def change
    rename_column :blog_posts, :user_id, :author_id
  end
end
