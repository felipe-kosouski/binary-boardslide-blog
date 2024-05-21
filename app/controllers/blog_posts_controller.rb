class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_by_slug, only: [:show]

  def index
    @blog_posts = user_signed_in? ? BlogPost.recent : BlogPost.published.recent
  end

  def show
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :summary, :content, :category_id, :published_at, :cover_image, :tags)
  end

  def find_by_slug
    @blog_post = user_signed_in? ? BlogPost.find_by(slug: params[:id]) : BlogPost.published.find_by(slug: params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def set_blog_post
    @blog_post = user_signed_in? ? BlogPost.find(params[:id]) : BlogPost.published.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
