class NotNullEvents < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:events, :name, false)
    change_column_null(:events, :start_time, false)
    change_column_null(:events, :archived, false)
  end
end
