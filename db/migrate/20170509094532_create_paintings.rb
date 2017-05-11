class CreatePaintings < ActiveRecord::Migration[5.0]
  def change
    create_table :paintings do |t|
      t.string :name
      t.attachment :picture
      t.decimal :price
      t.belongs_to :user
      t.timestamps
    end
  end
end
