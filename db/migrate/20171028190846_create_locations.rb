class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :description
      t.float :latitude
      t.float :longitude
      t.references :user, foreign_key: true
      t.boolean :archived
      t.string :image_url

      t.timestamps
    end
  end
end
