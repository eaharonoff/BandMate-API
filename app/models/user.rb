class User < ApplicationRecord
  belongs_to :city
  has_many :user_genres
  has_many :genres, through: :user_genres
  has_many :user_instruments
  has_many :instruments, through: :user_instruments
  has_many :friend_requests, foreign_key: 'sender_id'
  has_many :friend_requests, foreign_key: 'recipient_id'
  has_many :user_conversations
  has_many :conversations, through: :user_conversations
  has_many :messages
  has_many :user_bands
  has_many :bands, through: :user_bands
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  def all_friends
    self.friends + self.inverse_friends
  end

end
