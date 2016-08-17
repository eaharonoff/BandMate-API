class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :zip, :age, :bio, :soundcloud
  has_many :instruments
  has_many :genres
  has_many :sent_requests
  has_many :received_requests
  has_many :friends
  has_many :inverse_friends
  has_many :conversations
end
