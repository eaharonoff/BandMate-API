class ConversationsController < ApplicationController
  def show
    conversation = Conversation.find(params[:id])
    render json: conversation, include: ['messages']
  end

end
