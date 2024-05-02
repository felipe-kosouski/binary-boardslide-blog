require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? should return true when published_at is nil" do
    blog_post = BlogPost.new(published_at: nil)
    assert blog_post.draft?
  end

  test "scheduled? should return true when published_at is in the future" do
    blog_post = BlogPost.new(published_at: 1.day.from_now)
    assert blog_post.scheduled?
  end

  test "published? should return true when published_at is in the past" do
    blog_post = BlogPost.new(published_at: 1.day.ago)
    assert blog_post.published?
  end
end
