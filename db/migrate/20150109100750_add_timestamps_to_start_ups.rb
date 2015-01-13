class AddTimestampsToStartUps < ActiveRecord::Migration
  def change
    change_table :startups do |t|
      t.timestamps
    end
  end
end
