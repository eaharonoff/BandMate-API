class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :name, :users, :messages
  has_many :users
  has_many :messages
end
