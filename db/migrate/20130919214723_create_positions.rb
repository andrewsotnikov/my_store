class CreatePositions < ActiveRecord::Migration
  def up
    create_table :positions do |t|
      t.references :cart, index: true
      t.references :item, index: true
      t.integer :quantity, default: 0

      t.timestamps
    end
    
    drop_table :carts_items
  end
  
  def down
    drop_table :positions
    
    create_table :carts_items, id: false do |t|
      t.references :cart, index: true
      t.references :item, index: true
    end
  end
end
