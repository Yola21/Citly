class MakeUrlNotNullable < ActiveRecord::Migration[6.1]
  def change
    change_column_null :urls, :url, false
  end
end
