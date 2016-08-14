module Api
  module V1
    class CitiesController < ApplicationController
      def index
        render json: Hobby.includes(:users), include: 
          ['users']
      end
    end
  end
end
