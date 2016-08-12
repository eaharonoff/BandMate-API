class Band < ApplicationRecord
  has_many :user_bands
  has_many :users, through: :user_bands
  has_many :band_genres
  has_many :genres, through: :band_genres
end
