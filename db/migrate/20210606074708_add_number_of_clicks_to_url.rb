class AddNumberOfClicksToUrl < ActiveRecord::Migration[6.1]
  def change
    add_column :urls, :number_of_clicks, :integer, default: 0, null: false
  end
end
