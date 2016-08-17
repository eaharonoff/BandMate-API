class FriendshipsController < ApplicationController

  def create
    real_params = JSON.parse(params.keys[0])
    sender = User.find(real_params['senderId'])
    recipient = User.find(real_params['userId'])
    friendship = Friendship.create(user: sender, friend: recipient)
    friend_request = FriendRequest.find_by(sender: sender, recipient: recipient)
    friend_request.destroy
    render json: friend_request, include: ['sender', 'sender.genres', 'sender.instruments']
  end
end
