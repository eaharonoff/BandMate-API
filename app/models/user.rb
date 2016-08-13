class User < ApplicationRecord
  belongs_to :city
  has_many :user_genres
  has_many :genres, through: :user_genres
  has_many :user_instruments
  has_many :instruments, through: :user_instruments
  has_many :friend_requests, foreign_key: 'sender_id'
  has_many :friend_requests, foreign_key: 'recipient_id'
  has_many :friendships, foreign_key: 'friend_1_id'
  has_many :friendships, foreign_key: 'friend_2_id'
  has_many :conversations, foreign_key: 'user_1_id'
  has_many :conversations, foreign_key: 'user_2_id'
  has_many :messages
  has_many :user_bands
  has_many :bands, through: :user_bands

  def all_conversations
    Conversation.where('user_1_id = ?', self.id).or(Conversation.where('user_2_id = ?', self.id))
  end

  def all_friendships
    Friendship.where('user_1_id = ?', self.id).or(Friendship.where('user_2_id = ?', self.id))
  end

  def friends
    friend_ids = all_friendships.pluck(:user_1_id, :user_2_id).flatten.reject {|id| id == self.id}
    friend_ids.map {|id| User.find(id)}
    # refactor this to maintain collection proxy as opposed to ruby array
  end

end