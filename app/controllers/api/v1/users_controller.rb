module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: User.includes(:city, :instruments, :genres), include: ['city', 'instruments', 'genres']
      end
    end
  end
end
