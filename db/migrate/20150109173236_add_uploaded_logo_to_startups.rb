class AddUploadedLogoToStartups < ActiveRecord::Migration
  def change
    change_table :startups do |t|
      t.string :uploaded_logo, :after => :status
    end
  end
end
