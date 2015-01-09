namespace :typeform do

  desc "Grabs any new start up companies from the Typeform API"
  task get_new_start_ups: :environment do
    t = Typeform.new(ENV.fetch("TYPEFORM_UID"), ENV.fetch("TYPEFORM_API_KEY"))

    # TODO Get latest start up id and add it to the endpoint
    last_check = Metadata.get('typeform_checked_at');

    # r = RestClient.get(t.endpoint + '&completed=true')
    # r = MultiJson.load(r)

    # r['responses'].each do |startup|
    #   puts startup['answers']
    # end
  end

end
