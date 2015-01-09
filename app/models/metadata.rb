class Metadata < ActiveRecord::Base

  def self.get(key)
    data = where(key: key).first

    data = self.set(key, "") unless data

    data.value
  end

  def self.set(key, value)
    data = where(key: key).first

    if data
      data.value = value
    else
      data = self.new
      data.key = key
      data.value = value
    end

    data.save
    data
  end

end
