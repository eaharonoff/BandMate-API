class FriendRequestSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :sender
  belongs_to :recipient
end
