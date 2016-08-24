class FriendRequestsController < ApplicationController

  def create
    real_params = JSON.parse(params.keys[0])
    sender = User.find(real_params['myId'])
    recipient = User.find(real_params['userId'])
    if !FriendRequest.find_by(sender: sender, recipient: recipient) && !FriendRequest.find_by(sender: recipient, recipient: sender)
      friend_request = FriendRequest.create(sender: sender, recipient: recipient)
      render json: friend_request, include: ['recipient.id']
    else
      message = {info: "There is already a friend request with you and #{recipient.name}."}
      render json: message
    end
  end

  def delete
    real_params = JSON.parse(params.keys[0])
    sender = User.find(real_params['senderId'])
    recipient = User.find(real_params['userId'])
    friend_request = FriendRequest.find_by(sender: sender, recipient: recipient)
    render json: friend_request, include: ['recipient.id']
  end

end
