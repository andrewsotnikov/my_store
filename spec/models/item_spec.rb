#encoding: windows-1251
require 'spec_helper'

describe Item do
  it "не пустое поле name" do
    item = Item.new(name: '')
    item.valid?
    expect(item.errors[:name]).to_not be_empty
  end
end