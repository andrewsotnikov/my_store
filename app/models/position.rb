#encoding: windows-1251
class Position < ActiveRecord::Base
  belongs_to :item
  belongs_to :positionable, polymorphic: true
end
