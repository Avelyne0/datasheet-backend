class WargearOptionSerializer < ActiveModel::Serializer
  attributes :id, :option
  def user
    UserSerializer.new(self.object.user)
  end
end
