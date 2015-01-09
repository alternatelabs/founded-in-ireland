class TypeformApi
  attr_reader :uid, :api_key

  def initialize(uid = nil, api_key = nil)
    @uid = uid || ENV.fetch("TYPEFORM_UID")
    @api_key = api_key || ENV.fetch("TYPEFORM_API_KEY")
  end

  def fetch_new_startups
    r = RestClient.get(endpoint, params: {key: api_key, since: last_check, completed: true})
    r = MultiJson.load(r)

    startups = r['responses'].map do |startup|
      startup['answers'].transform_keys! {|key| question_ids_map[key] }
    end

    Metadata.set('typeform_checked_at', Time.now.to_i)

    startups
  end

  private

  def last_check
    Metadata.get('typeform_checked_at').presence || 0
  end

  def endpoint
    "https://api.typeform.com/v0/form/#{uid}"
  end

  def question_ids_map
    @question_ids_map ||= MultiJson.load(ENV.fetch("TYPEFORM_FIELD_IDS_TO_NAMES"))
  end

end