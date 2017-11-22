class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.string :name
      t.integer :api_id

      t.timestamps
    end
  end
end
