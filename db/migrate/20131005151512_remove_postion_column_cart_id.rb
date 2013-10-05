class RemovePostionColumnCartId < ActiveRecord::Migration
  def change
    remove_reference :positions, :cart 
  end
end
