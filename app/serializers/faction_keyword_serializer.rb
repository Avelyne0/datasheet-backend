class FactionKeywordSerializer < ActiveModel::Serializer
  attributes :id, :name
  def user
    UserSerializer.new(self.object.user)
  end
end
