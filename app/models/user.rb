class User < ApplicationRecord
  belongs_to :city
  has_many :user_genres
  has_many :genres, through: :user_genres
  has_many :user_instruments
  has_many :instruments, through: :user_instruments
  has_many :friend_requests, foreign_key: 'sender_id'
  has_many :friend_requests, foreign_key: 'recipient_id'
  has_one :network
  has_many :member_networks, foreign_key: 'member_id'
  has_many :networks, through: :member_networks
  has_many :user_conversations
  has_many :conversations, through: :user_conversations
  has_many :messages
  has_many :user_bands
  has_many :bands, through: :user_bands
end
