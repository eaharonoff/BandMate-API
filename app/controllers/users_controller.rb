class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    real_params = JSON.parse(params.keys[0])
    if !validate_genres_and_instruments(real_params)
      message = {info: 'please select at least one of each category'}
      render json: message
    else
      city = City.create(name: real_params['city']['name'])
      user = User.create(name: real_params['name'], city: city, email: real_params['email'], password: real_params['password'], soundcloud: real_params['soundcloud'])
      add_instruments_and_genres(real_params, user)
      render json: user, include: included_attributes
    end
  end

  def show
    user = User.find(params[:id])
    render json: user, include: included_attributes
  end

  def update
    real_params = JSON.parse(params.keys[0])
    if !validate_genres_and_instruments(real_params)
      message = {info: 'please select at least one of each category'}
      render json: message
    else
      user = User.find(real_params['id'])
      attributes = ['name', 'age', 'bio']
      attributes.each do |attribute|
        if real_params[attribute]
          user.update("#{attribute}": real_params[attribute])
        end
      end
      city = City.create(name: real_params['city']['name'])
      user.update(city: city)
      UserGenre.where('user_id = ?', user.id).destroy_all
      UserInstrument.where('user_id = ?', user.id).destroy_all
      add_instruments_and_genres(real_params, user)
      render json: user, include: included_attributes
    end
  end


  def login
    real_params = JSON.parse(params.keys[0])
    user = User.find_by(email: real_params['email'])
    friends = user.all_friends[0..3]
    if user && user.authenticate(real_params["password"])
      render json: user, include: included_attributes
    else
      message = {info: 'Incorrect Email / Password'}
      render json: message
    end
  end

  def validate_genres_and_instruments(real_params)
    genres = real_params["genres"]
    instruments = real_params["instruments"]
    genres.empty? || instruments.empty? ? false : [genres, instruments]
  end

  def add_instruments_and_genres(real_params, user)
    genres = validate_genres_and_instruments(real_params)[0]
    instruments = validate_genres_and_instruments(real_params)[1]
    instruments.split.each {|instrument| UserInstrument.create(user: user, instrument: Instrument.find_by(name: instrument))}
    genres.split.each {|genre| UserGenre.create(user: user, genre: Genre.find_by(name: genre))}
  end

  def filter
    real_params = JSON.parse(params.keys[0])
    genre_array = real_params["genres"].split.flatten
    instrument_array = real_params["instruments"].split.flatten
    filtered_users = lee_filter_users(genre_array, instrument_array).reject {|user| user.id === real_params['userId']}
    miles = real_params["miles"]
    user_city = real_params["userCity"]
    filter_by_distance(filtered_users, miles, user_city)
    render json: filtered_users.compact, include: ['name', 'age', 'city']
  end

  def filter_by_distance(filtered_users, miles, user_city)
    matrix = GoogleDistanceMatrix::Matrix.new
    cities = filtered_users.map {|user| user.city.name }
    origins = cities.map {|city| GoogleDistanceMatrix::Place.new address: city}
    origins.each {|origin| matrix.origins << origin}
    destination = GoogleDistanceMatrix::Place.new address: user_city
    matrix.destinations << destination
    distances = matrix.data.flatten.map {|datum| datum.distance_in_meters}
    indexes = distances.each_with_index.map { |distance, idx| distance > miles.to_f*1600 ? idx : nil }.compact
    indexes.each {|index| filtered_users[index] = nil }
  end


  def lee_filter_users(genre_array, instrument_array)
    User.all.sort_by {|user| user_index(genre_array, instrument_array, user)}.reverse
  end

  def user_index(genre_array, instrument_array, user)
    (user.genres.to_a.map {|genre| genre.name} & genre_array).length/(genre_array.length + 1).to_f + (user.instruments.to_a.map {|instrument| instrument.name} & instrument_array).length/(instrument_array.length + 1).to_f
  end

  def raoul_filter_users(genre_array, instrument_array)
    filtered_by_instruments = User.all.select {|user| (user.instruments & instrument_array).length >= 1}
    filtered_by_instruments.sort_by {|user| user.genres & genre_array.length }.reverse
  end

  def included_attributes
    ["city", "genres", "instruments", "soundcloud", "sent_requests", "sent_requests.recipient", "received_requests", "received_requests.sender", "friends", "inverse_friends", "conversations"]
  end

end
