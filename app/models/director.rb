# == Schema Information
#
# Table name: directors
#
#  id         :integer          not null, primary key
#  name       :string
#  api_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Director < ActiveRecord::Base
  has_many :movies, through: :director_movies
  has_many :director_movies

  def get_all_movies
    url = "https://api.themoviedb.org/3/person/#{api_id}/movie_credits?api_key=#{api_key}"
    response = HTTParty.get(url)
    response["crew"].select do |crew|
      crew["title"] if crew["job"] == "Director"
    end
  end

  private

  def api_key
    ENV.fetch("MOVIE_DB_API_KEY")
  end
end
