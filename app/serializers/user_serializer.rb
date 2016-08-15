class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :zip
  has_many :instruments
  has_many :genres
end
