class ChangeBlogPostCategoryToNullTrue < ActiveRecord::Migration[7.1]
  def change
    change_column_null :blog_posts, :category_id, true
  end
end
