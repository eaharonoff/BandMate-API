class UsersController < ApplicationController
  def index
    render json: User.includes(:city), include: [:city]
  end
end
