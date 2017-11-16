class CreateMoviesTable < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :description
      t.integer :genre_id
      t.boolean :owned
      t.datetime :last_watched

      t.timestamps
    end
  end
end
