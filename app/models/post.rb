class Post < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :title, :slug, :extract, :content, :status
  validates :slug, uniqueness: {case_sensitive: false}, slug: true, on: :create

  def self.published
    where(status: 'published').order(id: :desc)
  end

  def self.get_by_slug slug, published_only = true
    q = where(slug: slug)
    q = q.where(status: 'published') if published_only

    q.first
  end

  def nice_date
    created_at.strftime("%A, %d %B %Y, %H:%M")
  end

  def next
    @next_post ||= self.class.where(status: 'published').where("id > ?", id).order(id: :asc).first
  end

  def prev
    @prev_post ||= self.class.where(status: 'published').where("id < ?", id).order(id: :desc).first
  end

end