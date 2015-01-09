class Startup < ActiveRecord::Base

  def self.createFromTypeform answers
    instance = self.new

    typeform_fields = eval(ENV.fetch('TYPEFORM_FIELDS'))

    data = {}
    typeform_fields.each do |k, v|
      # puts "#{k} = #{answers[v]}"
      data[k] = answers[v]
    end

    puts data

  end

end