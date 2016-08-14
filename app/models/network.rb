class Network < ApplicationRecord
  belongs_to :user
  has_many :member_networks
  has_many :members, through: :member_networks, class_name: 'User'
end
