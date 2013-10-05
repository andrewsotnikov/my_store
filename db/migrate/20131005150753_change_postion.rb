class ChangePostion < ActiveRecord::Migration
  def change
    change_table :positions do |t|
      t.references :positionable, polymorphic: true, index: true
    end
  end
end
