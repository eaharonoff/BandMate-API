class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    real_params = JSON.parse(params.keys[0])
    User.create(email: real_params['email'], password: real_params['password'], zip: real_params['zip'])
    instruments = real_params["instruments"]
    genres = real_params["genres"]
    instruments.split.each {|instrument| UserInstrument.create(user: User.last, instrument: Instrument.find_by(name: instrument))}
    genres.split.each {|genre| UserGenre.create(user: User.last, genre: Genre.find_by(name: genre))}
  end

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
