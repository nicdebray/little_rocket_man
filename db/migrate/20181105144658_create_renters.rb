class CreateRenters < ActiveRecord::Migration[5.2]
  def change
    create_table :renters do |t|
      t.string :first_name
      t.string :last_name
      t.string :country
      t.referecnces :user

      t.timestamps
    end
  end
end
