class MessagesController < ApplicationController
  def create
    real_params = JSON.parse(params.keys[0])
    Message.create(conversation_id: real_params['conversationId'], sender_id: real_params['currentUserId'], body: real_params['message'])
    conversation = Conversation.find(real_params['conversationId'])
    render json: conversation, include: ['messages']
  end
end
