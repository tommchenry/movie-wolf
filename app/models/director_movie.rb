# == Schema Information
#
# Table name: director_movies
#
#  id          :integer          not null, primary key
#  movie_id    :integer
#  director_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class DirectorMovie < ActiveRecord::Base
  belongs_to :director
  belongs_to :movie
end
