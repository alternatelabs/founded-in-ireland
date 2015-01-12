class Post < ActiveRecord::Base

  validates_presence_of :title, :slug, :extract, :content, :status
  validates_uniqueness_of :slug, on: :create

end
