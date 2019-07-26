class AbilitySerializer < ActiveModel::Serializer
  attributes :id, :name, :content
  def user
    UserSerializer.new(self.object.user)
  end
end
