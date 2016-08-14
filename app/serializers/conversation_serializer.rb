class ConversationSerializer < ActiveModel::Serializer
  has_many :messages
  has_many :users
  attributes :id, :name
end
