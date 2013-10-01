#encoding: windows-1251
class AdminController < ApplicationController
  before_filter :access_admin
  layout "admin"
  
  def users_count
    @users_count = User.count
  end
end
