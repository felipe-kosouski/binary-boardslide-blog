class RemoveTagsFromCategories < ActiveRecord::Migration[7.1]
  def change
    remove_column :categories, :tags, :string
  end
end
