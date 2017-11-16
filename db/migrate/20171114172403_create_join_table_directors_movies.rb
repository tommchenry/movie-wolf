class CreateJoinTableDirectorsMovies < ActiveRecord::Migration
  def change
    create_table :director_movies do |t|
      t.references :movie
      t.references :director

      t.timestamps
    end
  end
end
