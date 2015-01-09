class Typeform
  attr_reader :endpoint

  def initialize(uid, api_key)
    @endpoint = "https://api.typeform.com/v0/form/#{uid}?key=#{api_key}"
  end

end