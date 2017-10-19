class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.string :rater
      t.text :comment
      t.integer :score
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
