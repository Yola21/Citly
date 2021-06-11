class AddPinnedToUrl < ActiveRecord::Migration[6.1]
  def change
    add_column :urls, :status, :integer, default: 0, null: false
  end
end
