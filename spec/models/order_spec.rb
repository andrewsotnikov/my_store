#encoding: windows-1251
require 'spec_helper'

describe Order do
  it "расчет стоимости заказа" do
    item1 = create(:item, price: 10)
    item2 = create(:item, price: 20)
    
    order = build(:order)
    order.items << item1
    order.items << item2
    
    order.calculate_order
    expect(order.total).to eq(30)
  end
  
  it "исключение при оформлении пустого заказа" do
    expect(->{create(:order)}).to raise_exception
  end
end