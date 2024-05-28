class Admin::BlogPostsController < Admin::BaseController
  before_action :find_by_slug, only: [:show, :edit, :update, :destroy]

  def index
    @blog_posts = BlogPost.recent
  end

  def show
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to admin_blog_post_path @blog_post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to admin_blog_post_path @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to blog_posts_path
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :summary, :content, :category_id, :published_at, :cover_image, :tags)
  end

  def find_by_slug
    @blog_post = BlogPost.find_by(slug: params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
