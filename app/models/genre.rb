class Genre < ApplicationRecord
  has_many :user_genres
  has_many :users, through: :user_genres
  has_many :band_genres
  has_many :bands, through: :band_genres
end
