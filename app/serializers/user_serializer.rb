class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :instruments, :genres, :conversations, :messages, :friend_requests,:networks
end

