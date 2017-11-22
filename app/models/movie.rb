# == Schema Information
#
# Table name: movies
#
#  id           :integer          not null, primary key
#  title        :string
#  year         :integer
#  description  :string
#  genre_id     :integer
#  owned        :boolean
#  has_artwork  :boolean
#  last_watched :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

class Movie < ActiveRecord::Base
  has_many :directors, through: :director_movies
  has_many :director_movies

  def get_api_info
    search_query = URI::encode(title)
    url = "https://api.themoviedb.org/3/search/movie?api_key=#{api_key}&language=en-US&query=#{search_query}&page=1&include_adult=false&year=#{year}"
    response = HTTParty.get(url)
    self.title = response["results"].first["title"]
    self.year = response["results"].first["release_date"][0..3]
    self.description = response["results"].first["overview"]
    movie_api_id = response["results"].first["id"]
    get_director(movie_api_id)
  end

  def get_director(movie_api_id)
    url = "https://api.themoviedb.org/3/movie/#{movie_api_id}?api_key=#{api_key}&append_to_response=credits"
    response = HTTParty.get(url)
    response["credits"]["crew"].each do |crew|
      if crew["job"] == "Director"
        director = create_director(crew)
        self.directors << director
      end
    end
  end

  private

  def create_director(crew)
    name = crew["name"]
    api_id = crew["id"]
    Director.find_or_create_by(name: name, api_id: api_id)
  end

  def api_key
    ENV.fetch("MOVIE_DB_API_KEY")
  end
end
