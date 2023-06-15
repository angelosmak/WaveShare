class AddPhotoUrlToBeaches < ActiveRecord::Migration[7.0]
  def change
    add_column :beaches, :photo_url, :string
  end
end
