class AddStatusToStartups < ActiveRecord::Migration
  def change
    change_table :startups do |t|
      t.string :status, :default => "pending", :after => :extra_info
    end
  end
end
