class CreateUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      t.text :url
      t.timestamps
    end
  end
end
