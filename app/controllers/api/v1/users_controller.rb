module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: User.includes(:city), include: ['city']
      end
    end
  end
end
