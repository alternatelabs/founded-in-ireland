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

  rescue NoMethodError => e
    {}
  end

  def self.set_group key, params
    self.send(key).each do |field|
      self.set(field, params[field])
    end

  rescue NoMethodError => e
    raise GroupNotFound, "No group for key #{key}"
  end

  class GroupNotFound < StandardError
  end

  private

    def self.homepage_group
      %w[homepage_header_content homepage_footer_content homepage_contact_email]
    end

end
