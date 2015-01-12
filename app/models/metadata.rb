class Metadata < ActiveRecord::Base

  def self.get(key)
    data = where(key: key).first
    data = self.set(key, "") unless data
    data.value
  end

  def self.set(key, value)
    data = where(key: key).first_or_create
    data.update(value: value)
    data
  end

  def self.get_group key
    group = {}
    self.send(key).each do |field|
      group[field] = self.get(field)
    end

    group
  end

  def self.set_group key, params
    self.send(key).each do |field|
      self.set(field, params.permit(field).first[1])
    end
  end

  private

    def self.homepage_group
      ['homepage_header_content', 'homepage_footer_content']
    end

end
