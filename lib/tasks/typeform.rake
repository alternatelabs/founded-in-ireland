namespace :typeform do

  desc "Grabs any new start up companies from the Typeform API"
  task get_new_start_ups: :environment do
    new_startups = TypeformApi.new.fetch_new_startups

    new_startups.each do |startup_data|
      Startup.create!(startup_data)
    end
  end

end