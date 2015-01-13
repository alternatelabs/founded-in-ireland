class AddUploadedLogoToStartups < ActiveRecord::Migration
  def change
    add_column :startups, :uploaded_logo_file_name, :string
    add_column :startups, :uploaded_logo_file_size, :string
    add_column :startups, :uploaded_logo_content_type, :string
    add_column :startups, :uploaded_logo_updated_at, :string
  end
end
