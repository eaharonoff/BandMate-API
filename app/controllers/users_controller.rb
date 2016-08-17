class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

    real_params = JSON.parse(params.keys[0])
    user = User.create(name: real_params['name'], zip: real_params['zip'], email: real_params['email'], password: real_params['password'], soundcloud: real_params['soundcloud'])
    add_instruments_and_genres(real_params, user)
    render json: user, include: ["genres", "instruments", "soundcloud", "sent_requests", "sent_requests.recipient", "received_requests", "received_requests.sender", "friends", "friends.genres", "friends.instruments", "inverse_friends", "inverse_friends.genres", "inverse_friends.instruments", "conversations"]
  end

  def show
    byebug
    user = User.find(params[:id])
    render json: user, include: ["genres", "instruments", "soundcloud", "sent_requests", "sent_requests.recipient", "received_requests", "received_requests.sender", "friends", "friends.genres", "friends.instruments", "inverse_friends", "inverse_friends.genres", "inverse_friends.instruments"]
  end


  def update
    real_params = JSON.parse(params.keys[0])
    user = User.find(real_params['id'])
    user.update(name: real_params['name'], zip: real_params['zipcode'], age: real_params['age'], bio: real_params['bio'])
    UserGenre.where('user_id = ?', user.id).destroy_all
    UserInstrument.where('user_id = ?', user.id).destroy_all
    add_instruments_and_genres(real_params, user)
    render json: user, include: ["genres", "instruments", "soundcloud", "sent_requests", "sent_requests.recipient", "received_requests", "received_requests.sender", "friends", "friends.genres", "friends.instruments", "inverse_friends", "inverse_friends.genres", "inverse_friends.instruments", "conversations"]
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
      render json: user, include: ["genres", "instruments", "soundcloud", "sent_requests", "sent_requests.recipient", "received_requests", "received_requests.sender", "friends", "friends.genres", "friends.instruments", "inverse_friends", "inverse_friends.genres", "inverse_friends.instruments", "conversations"]
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

  def filter
    real_params = JSON.parse(params.keys[0])
    genre_array = real_params["genres"].split.flatten
    instrument_array = real_params["instruments"].split.flatten
    filtered_users = lee_filter_users(genre_array, instrument_array).reject {|user| user.id === real_params['userId']}
    render json: filtered_users, include: ['name', 'age', 'instruments', 'genres']
  end


  def lee_filter_users(genre_array, instrument_array)
    User.all.sort_by {|user| (user.genres & genre_array).length/(genre_array.length + 1) + (user.instruments & instrument_array).length/(instrument_array.length + 1)}.reverse
  end

  def raoul_filter_users(genre_array, instrument_array)
    filtered_by_instruments = User.all.select {|user| (user.instruments & instrument_array).length >= 1}
    filtered_by_instruments.sort_by {|user| user.genres & genre_array.length }.reverse
  end

end
