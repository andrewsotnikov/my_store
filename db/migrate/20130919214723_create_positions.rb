class CreatePositions < ActiveRecord::Migration
  def up
    create_table :positions do |t|
      t.integer :cart_id
      t.integer :item_id
      t.integer :quantity, default: 0

      t.timestamps
    end
    add_index :positions, :cart_id
    add_index :positions, :item_id
    
    drop_table :carts_items
  end
  
  def down
    drop_table :positions
    
    create_table :carts_items, id: false do |t|
      t.integer :cart_id
      t.integer :item_id
    end
  end
end
