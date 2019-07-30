class WeaponSerializer < ActiveModel::Serializer
  attributes :id, :name, :weapon_range, :weapon_type, :weapon_strength, :armour_piercing, :weapon_damage, :weapon_ability
  def user
    UserSerializer.new(self.object.user)
  end
end
