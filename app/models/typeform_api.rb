require "json"

class TypeformApi
  attr_reader :uid, :api_key

  def initialize(uid = nil, api_key = nil)
    @uid = uid || ENV.fetch("TYPEFORM_UID")
    @api_key = api_key || ENV.fetch("TYPEFORM_ACCESS_TOKEN")
  end

  def fetch_new_startups
    res = HTTP.auth("Bearer #{api_key}")
              .get(endpoint, params: { since: last_check, completed: true })
    res = JSON.parse(res.body.to_s, symbolize_names: true)

    startups = res[:items].map do |startup|
      startup[:answers].inject({}) do |memo, answer|
        field_name = question_ids_map[answer[:field][:id]]
        field_value = answer[answer[:type].to_sym]
        memo[field_name] = field_value
        memo
      end
    end

    Metadata.set('typeform_checked_at', Time.now.to_i)

    startups
  end

  private

  def last_check
    Metadata.get('typeform_checked_at').presence
  end

  def endpoint
    "https://api.typeform.com/forms/#{uid}/responses"
  end

  def question_ids_map
    @question_ids_map ||= JSON.parse(ENV.fetch("TYPEFORM_FIELD_IDS_TO_NAMES"))
  end

end
