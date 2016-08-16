class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :zip, :age, :bio
  has_many :instruments
  has_many :genres
end
