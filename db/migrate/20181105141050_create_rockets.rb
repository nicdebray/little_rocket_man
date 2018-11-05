class CreateRockets < ActiveRecord::Migration[5.2]
  def change
    create_table :rockets do |t|
      t.string :type
      t.integer :capacity
      t.integer :price
      t.string :destination
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
