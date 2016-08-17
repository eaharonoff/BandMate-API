class FriendshipsController < ApplicationController

  def create
    real_params = JSON.parse(params.keys[0])
    sender = User.find(real_params['senderId'])
    recipient = User.find(real_params['userId'])
    Friendship.create(user: sender, friend: recipient)
    FriendRequest.where('sender_id = ? AND recipient_id = ?', sender.id, recipient.id).destroy_all
    render json: recipient, include: ["name", "zip", "age", "bio", "genres", "instruments", "sent_requests", "sent_requests.recipient", "received_requests", "received_requests.sender", "friends", "friends.genres", "friends.instruments", "inverse_friends", "inverse_friends.genres", "inverse_friends.instruments"]
  end
end
