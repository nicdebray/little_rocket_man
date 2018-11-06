class UpdateColumnTypeName < ActiveRecord::Migration[5.2]
  def change
    rename_column :rockets, :type, :rocket_type
  end
end
