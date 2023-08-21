class RemoveFieldsFromMessages < ActiveRecord::Migration[7.0]
  def change
    remove_column :messages, :likes, :string
    remove_column :messages, :parent_id, :string
  end
end
