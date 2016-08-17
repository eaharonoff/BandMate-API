class ConversationsController < ApplicationController
  def show
    byebug
    conversation = Conversation.find(params[:id])
    render json: conversation, include: ['messages', 'users', 'messages.user']
  end
end
