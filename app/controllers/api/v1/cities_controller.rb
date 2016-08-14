module Api
  module V1
    class CitiesController < ApplicationController
      def index
        render json: City.includes(:users), include: ('users')
      end
    end
  end
end
