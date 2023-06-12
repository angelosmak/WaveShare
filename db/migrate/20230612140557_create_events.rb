class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :beach, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.date :date
      t.text :description
      
      t.timestamps
    end
  end
end
