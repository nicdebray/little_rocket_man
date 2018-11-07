class ChangeNameRocketType < ActiveRecord::Migration[5.2]
  def change
    rename_column :rockets, :rocket_type, :name
  end
end
