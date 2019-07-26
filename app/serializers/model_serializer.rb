class ModelSerializer < ActiveModel::Serializer
  attributes :id, :name, :movement, :weapon_skill, :ballistic_skill, :strength, :toughness, :wounds. :attacks, :leadership, :armour_save, :points
  def user
    UserSerializer.new(self.object.user)
  end
end
