class AddItemIndexPrice < ActiveRecord::Migration
  def change
    add_index :items, :price
  end
end
