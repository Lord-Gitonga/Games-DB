class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :comments
      t.integer :star_rating
      t.integer :user_id
      t.integer :game_id
      t.timestamps
    end
  end
end
