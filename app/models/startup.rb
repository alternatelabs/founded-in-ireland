class Startup < ActiveRecord::Base

  validates_presence_of :name, :year_founded, :url, :status


  def self.create_from_typeform answers
    data = {}
    eval(ENV.fetch('TYPEFORM_FIELDS')).each do |k, v|
      data[k] = answers[v]
    end

    startup = create(data)

    startup
  end

end