class Page < ActiveRecord::Base

  validates_presence_of :title, :slug, :content
  validates_uniqueness_of :slug, on: :create

  def self.get_by_slug slug
    where(slug: slug).first
  end

end
