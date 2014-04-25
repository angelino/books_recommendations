class CreateBookRatings < ActiveRecord::Migration
  def change
    create_table :book_ratings do |t|
      t.references :book
      t.references :user
      t.integer :rating

      t.timestamps
    end

    add_index :book_ratings, [:book_id, :user_id]
    add_index :book_ratings, :rating
  end
end
