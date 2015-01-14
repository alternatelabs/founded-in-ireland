class Startup < ActiveRecord::Base

  validates_presence_of :name, :year_founded, :url, :status

  has_attached_file :uploaded_logo,
    styles: { standard: "500x500" },
    default_url: "default.jpg",
    path: "images/:style/:id_:filename",
    preserve_files: true

  validates_attachment_content_type :uploaded_logo, content_type: /\Aimage\/.*\Z/
  # validates_attachment_presence :uploaded_logo


  def self.get_active
    where(status: 'active')
  end

end
