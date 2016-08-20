class ConversationsController < ApplicationController
  
  def create 
    real_params = JSON.parse(params.keys[0])
    user1 = User.find(real_params['currentUser'])
    user2 = User.find(real_params['userClicked'])
    conversation = Conversation.create(user1_id: real_params['currentUser'],  user1_name: user1.name, user2_id: real_params['userClicked'], user2_name: user2.name)
    render json: conversation, include: ['messages']
  end

  def show
    conversation = Conversation.find(params[:id])
    render json: conversation, include: ['messages']
  end

end
