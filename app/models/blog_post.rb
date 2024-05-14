class BlogPost < ApplicationRecord
  after_validation :set_slug, on: :create
  has_one_attached :cover_image

  validates :title, presence: true
  validates :summary, presence: true
  validates :content, presence: true

  belongs_to :category, optional: true
  has_many :blog_post_tags
  has_many :tags, through: :blog_post_tags

  scope :recent, -> { order(arel_table[:published_at].desc.nulls_last) }
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }

  has_rich_text :content

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at > Time.current
  end

  def set_slug
    self.slug = self.title.parameterize
  end

  def to_param
    slug
  end
end
