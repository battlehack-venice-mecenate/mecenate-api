class CreatePois < ActiveRecord::Migration
  def change
    create_table :pois do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.deciaml :lat, {:precision=>10, :scale=>6}
      t.deciaml :lon, {:precision=>10, :scale=>6}

      t.timestamps
    end
  end
end
