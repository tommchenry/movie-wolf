require 'csv'
require 'net/http'

ROOT_URL = "noncanon.online"
FILENAME = "movie_db.csv"

namespace :movies do
  desc "Generate movies from CSV file"
  task :import_from_csv => :environment do |t|
    tmp_file_name = "#{Rails.root}/tmp/movie_db.csv"
    Net::HTTP.start(ROOT_URL) do |http|
      resp = http.get("/csv/#{FILENAME}")
      open(tmp_file_name, "wb") do |file|
        file.write(resp.body)
      end
    end
    puts "File Downloaded."
    CSV.foreach(tmp_file_name) do |csv|
      title = csv[0]
      has_artwork = csv[1].strip == "y" ? true : false
      movie = Movie.find_by(title:title)
      unless movie
        movie = Movie.create(title:title)
        movie.owned = true
        movie.has_artwork = has_artwork
        movie.get_api_info
        puts "Is #{movie.title} from #{movie.year}, directed by #{movie.directors.first.name} correct? (y/n)"
        answer = STDIN.gets.chomp
        unless answer == "n"
          movie.save
        end
      end
    end
    puts "File Imported."
  end
end
