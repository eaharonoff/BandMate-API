module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = User.all
        render json: users.includes(:network), include: ['network', 'network.members']
      end

      def show_conversations
        user = User.find(params[:id])
        conversations = user.conversations
        render json: conversations.includes(:users), include: ['name', 'users']
      end
    end
  end
end
