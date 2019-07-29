class ChangeWeaponColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :weapons, :weapon_name, :name
  end
end
