class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.datetime :start_time
      t.string :sound_cloud_url
      t.string :sound_cloud_user_id
      t.references :location, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :archived
      t.string :image_url

      t.timestamps
    end
  end
end
