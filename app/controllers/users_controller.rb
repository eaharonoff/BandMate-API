class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    real_params = JSON.parse(params.keys[0])
    current_user = User.create(email: real_params['email'], password: real_params['password'], zip: real_params['zip'])
    instruments = real_params["instruments"]
    genres = real_params["genres"]
    instruments.split.each {|instrument| UserInstrument.create(user: User.last, instrument: Instrument.find_by(name: instrument))}
    genres.split.each {|genre| UserGenre.create(user: User.last, genre: Genre.find_by(name: genre))}
    render json: current_user, include: ["instruments", "genres"]
  end

  def index
    users = User.all
    render json: users, include: ['name', 'instruments', 'genres']
  end

  def show_conversations
    user = User.find(params[:id])
    conversations = user.conversations
    render json: conversations.includes(:users), include: ['name', 'users']
  end

  def login
    real_params = JSON.parse(params.keys[0])
    user = User.find_by(email: real_params['email'])
    if user && user.authenticate(real_params["password"])
      render json: user, include: ['instruments', 'genres']
    else
      message = {info: 'Incorrect Email / Password'}
      render json: message
    end
  end

end
