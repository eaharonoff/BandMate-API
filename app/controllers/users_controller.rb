class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    real_params = JSON.parse(params.keys[0])
    user = User.create(name: real_params['name'], zip: real_params['zip'], email: real_params['email'], password: real_params['password'])
    add_instruments_and_genres(real_params, user)
    render json: user, include: ["name", "zip", "genres", "instruments"]
  end

  def show
    user = User.find(params[:id])
    render json: user, include: ['instruments', 'genres', 'all_friends']
  end

  def edit
    real_params = JSON.parse(params.keys[0])
    user = User.find(real_params['id'])
    user.update(name: real_params['name'], zip: real_params['zipcode'], age: real_params['age'], bio: real_params['bio'])
    UserGenre.where('user_id = ?', user.id).destroy_all
    UserInstrument.where('user_id = ?', user.id).destroy_all
    add_instruments_and_genres(real_params, user)
    render json: user, include: ["name", "zip", "age", "bio", "genres", "instruments"]
  end



  # def index
  #   users = User.all
  #   render json: users, include: ['name', 'instruments', 'genres']
  # end
  #
  # # def show_conversations
  # #   user = User.find(params[:id])
  # #   conversations = user.conversations
  # #   render json: conversations.includes(:users), include: ['name', 'users']
  # # end

  def login
    real_params = JSON.parse(params.keys[0])
    user = User.find_by(email: real_params['email'])
    friends = user.all_friends[0..3]
    if user && user.authenticate(real_params["password"])
      render json: user, include: ['instruments', 'genres', 'all_friends']
    else
      message = {info: 'Incorrect Email / Password'}
      render json: message
    end
  end

  def add_instruments_and_genres(real_params, user)
    genres = real_params["genres"]
    instruments = real_params["instruments"]
    instruments.split.each {|instrument| UserInstrument.create(user: user, instrument: Instrument.find_by(name: instrument))}
    genres.split.each {|genre| UserGenre.create(user: user, genre: Genre.find_by(name: genre))}
  end

end
