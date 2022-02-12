class CreateGyms < ActiveRecord::Migration[6.1]
  def change
    create_table :gyms do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.text :URL
      t.string :TEL
      t.string :address, null: false
      t.integer :ward, null: false
      t.string :img

      t.timestamps
    end
  end
end
