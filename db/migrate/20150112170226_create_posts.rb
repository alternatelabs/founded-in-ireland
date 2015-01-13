class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.string :extract
      t.text :content
      t.string :status, default: 'draft'
      t.integer :user_id
      t.timestamps
    end
  end
end
