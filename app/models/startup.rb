class Startup < ActiveRecord::Base

  validates_presence_of :name, :year_founded, :url, :status

end