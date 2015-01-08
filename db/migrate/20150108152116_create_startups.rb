class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
    	t.string :name
    	t.integer :year_founded
    	t.string :location
    	t.text :description
    	t.string :url
    	t.string :twitter
    	t.string :logo_url
    	t.string :contact_name
    	t.string :contact_email
    	t.text :extra_info
    end
  end
end
