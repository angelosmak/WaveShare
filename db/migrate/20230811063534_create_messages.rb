class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :beach, null: false, foreign_key: true
      t.integer :likes
      t.references :parent, foreign_key: { to_table: :messages } # Check this line

      t.timestamps
    end
  end
end
