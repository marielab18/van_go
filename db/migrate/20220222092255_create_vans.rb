class CreateVans < ActiveRecord::Migration[6.1]
  def change
    create_table :vans do |t|
      t.string :size
      t.string :model
      t.string :brand
      t.integer :year
      t.float :price
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
