class AddItemIndexName < ActiveRecord::Migration
  def change
    add_index :items, :name 
  end
end
