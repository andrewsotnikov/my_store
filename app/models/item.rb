#encoding: windows-1251
class Item < ActiveRecord::Base
  validates :price, numericality: { greater_than: 0, allow_nil: true }
  validates :name, :description, presence: true
  
  after_initialize { } # Item.new; Item.first; Item.last 
  after_save { } # Item.save; Item.create; Item.update; item.update_attributes()
  after_create { } # Item.create
  after_update { } # Item.update; item.update_attributes()
  after_destroy { } # item.destroy
end
