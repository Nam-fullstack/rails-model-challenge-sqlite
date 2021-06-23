class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.string :title
      t.text :description
      t.integer :year
      t.string :genre
      t.references :director, null: false, foreign_key: true

      t.timestamps
    end
  end
end
