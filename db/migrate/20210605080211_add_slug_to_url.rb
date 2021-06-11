class AddSlugToUrl < ActiveRecord::Migration[6.1]
  def change
    add_column :urls, :slug, :string, null: false
    add_column :urls, :shortened_url, :string, null: false
  end
end
