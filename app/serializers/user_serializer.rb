class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :instruments, :genres 
  belongs_to :city
  has_many :instruments 
  has_many :genres
end
