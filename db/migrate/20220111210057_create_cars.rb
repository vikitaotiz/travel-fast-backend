class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :image
      t.text :description
      t.integer :price
      t.integer :seats
      t.integer :duration

      t.timestamps
    end
  end
end
