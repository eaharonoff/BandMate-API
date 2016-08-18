class User < ApplicationRecord
  has_secure_password
  belongs_to :city
  has_many :user_genres
  has_many :genres, through: :user_genres
  has_many :user_instruments
  has_many :instruments, through: :user_instruments
  has_many :sent_requests, :class_name => 'FriendRequest', foreign_key: 'sender_id'
  has_many :received_requests, :class_name=> 'FriendRequest', foreign_key: 'recipient_id'
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

  def accept_request(from_user_id)
    Friendship.create(user_id: self.id, friend_id: from_user_id)
  end

end
