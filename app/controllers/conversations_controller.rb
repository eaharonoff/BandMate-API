class ConversationsController < ApplicationController
  
  def create 
    real_params = JSON.parse(params.keys[0])
    conversation = Conversation.create(user1_id: real_params['currentUser'], user2_id: real_params['userClicked'])
    byebug
    render json: conversation, include: ['messages']
  end

  def show
    conversation = Conversation.find(params[:id])
    render json: conversation, include: ['messages']
  end

end
