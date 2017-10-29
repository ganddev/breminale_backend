class NotNullLatitudeLongitude < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:locations, :latitude, false)
    change_column_null(:locations, :longitude, false)
    change_column_null(:locations, :name, false)
    change_column_default(:locations, :archived, false)
  end
end
