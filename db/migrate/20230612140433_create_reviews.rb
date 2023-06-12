class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :rating
      t.references :beach, null: false, foreign_key: true

      t.timestamps
    end
  end
end
