class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :product, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :description
      t.integer :rating
      t.timestamps null: false
    end
  end
end

# product_id (integer)
# user_id (integer)
# description (text)
# rating (integer)
# createdat and updatedat timestamps (datetime)
# all tables should have this (default)
