class CreateCartsItems < ActiveRecord::Migration
  def change
    create_table :carts_items, id: false do |t|
      t.references :cart, index: true
      t.references :item, index: true
    end
  end
end
