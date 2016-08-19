class ConversationSerializer < ActiveModel::Serializer
  has_many :messages
  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'
  attributes :id, :subject, :messages
end
