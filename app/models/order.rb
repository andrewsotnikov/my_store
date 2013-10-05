#encoding: windows-1251
class Order < ActiveRecord::Base
  belongs_to :user
  # has_and_belongs_to_many :items
  has_many :positions, as: :positionable
  has_many :items, through: :positions
  
  before_save do
    raise "Заказ не содержит товаров" if items.empty?
  end
  
  def calculate_order
    write_attribute :total, items.map(&:price).inject(:+)
  end 
end
