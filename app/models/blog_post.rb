#encoding: windows-1251
class BlogPost < ActiveRecord::Base
  has_many :comments, as: :commentable
end
