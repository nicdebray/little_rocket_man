class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :company
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
