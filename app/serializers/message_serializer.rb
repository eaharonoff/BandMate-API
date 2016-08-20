class MessageSerializer < ActiveModel::Serializer
  attributes :body, :conversation_id, :sender
  belongs_to :sender, class_name: 'User'

end
