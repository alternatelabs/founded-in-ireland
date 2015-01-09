namespace :typeform do

  desc "Grabs any new start up companies from the Typeform API"
  task get_new_start_ups: :environment do

    last_check = Metadata.get('typeform_checked_at');

    r = RestClient.get(get_endpoint(since: last_check, completed: true))
    r = MultiJson.load(r)

    r['responses'].each do |startup|
      Startup.createFromTypeform startup['answers']
    end
  end

  def get_endpoint(*args)
    endpoint = Typeform.new(ENV.fetch("TYPEFORM_UID"), ENV.fetch("TYPEFORM_API_KEY")).endpoint

    args.each do |arg|
      arg.each do |k,v|
        endpoint << "&#{k}=#{v}" if v.present?
      end
    end

    endpoint
  end

end
