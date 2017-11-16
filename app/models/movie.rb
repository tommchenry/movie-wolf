class Movie < ActiveRecord::Base
  has_many :directors, through: :director_movies
  has_many :director_movies
end
