class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :name
      t.attachment :file
      t.belongs_to :user
      t.timestamps
    end
  end
end
