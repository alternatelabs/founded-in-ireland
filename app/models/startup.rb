class Startup < ActiveRecord::Base

  def self.createFromTypeform answers
    data = {}
    eval(ENV.fetch('TYPEFORM_FIELDS')).each do |k, v|
      data[k] = answers[v]
    end

    startup = create(data)

    startup
  end

end