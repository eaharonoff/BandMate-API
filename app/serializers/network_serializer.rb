class NetworkSerializer < ActiveModel::Serializer
  attributes :id
  has_many :members, class_name: 'User'
end
