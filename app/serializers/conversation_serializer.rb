class ConversationSerializer < ActiveModel::Serializer
  has_many :messages
  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'
  attributes :id, :messages, :user1_name, :user1_id, :user2_id, :user2_name
end
