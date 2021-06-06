class AddPinnedToUrl < ActiveRecord::Migration[6.1]
  def change
    add_column :urls, :pinned, :integer, default: 0, null: false
  end
end
