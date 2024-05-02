require "test_helper"

class BlogPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blog_posts_path
    assert_response :success
  end

  test "should get show" do
    get blog_post_path(blog_posts(:post_one).id)
    assert_response :success
  end
end
