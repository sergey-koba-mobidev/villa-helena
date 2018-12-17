class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string  :title
      t.boolean :main
      t.boolean :circle
      t.integer :position
      t.timestamps
    end
  end
end
