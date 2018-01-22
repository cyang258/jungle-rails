class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.text :description
      t.integer :rating
      t.integer :product_id

      t.timestamps null: false
    end
  end
end