class UnitSerializer < ActiveModel::Serializer
  attributes :id, :composition, :name
  def user
    UserSerializer.new(self.object.user)
  end
end
