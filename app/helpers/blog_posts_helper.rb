module BlogPostsHelper
  def categories_for_select
    Category.all
  end
end
