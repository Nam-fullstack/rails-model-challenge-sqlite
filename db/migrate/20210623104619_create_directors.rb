class CreateDirectors < ActiveRecord::Migration[6.0]
  def change
    create_table :directors do |t|
      t.string :name
      t.string :country
      t.boolean :active

      t.timestamps
    end
  end
end
