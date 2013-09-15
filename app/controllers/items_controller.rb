#encoding: windows-1251
class ItemsController < ApplicationController
  before_filter :get_admin
  before_filter :check_admin, only: [:new, :edit, :create, :update, :destroy]
  before_filter :find_item, only: [:show, :edit, :update, :destroy]
  
  # /items GET
  def index
    @items = Item.all
    #render text: @items.map { |i| "#{i.id} = #{i.name}: #{i.price} руб" }.join("<br/>") 
  end
  
  # /items/1 GET
  def show
  end
  
  # /items/new GET
  def new
    @item = Item.new
  end
  
  # /items/1/edit GET
  def edit
  end
  
  # /items POST
  def create
    @item = Item.create(params_item)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render "new"
    end
  end
  
  # /items/1 PUT
  def update
    if @item
      @item.update_attributes(params_item)
      if @item.errors.empty?
        redirect_to item_path(@item)
      else
        render "edit"
      end 
    end
  end
  
  # /items/1 DELETE
  def destroy
    if @item
      @item.destroy
      if @item.errors.empty?
        redirect_to items_path
      else
        redirect_to item_path(@item)
      end
    end
  end
  
  private
  
    def params_item
      params.require(:item).permit(
        :name,
        :price,
        :real,
        :weight,
        :description 
      )
    end
    
    def find_item
      unless @item = Item.where(id: params[:id]).first
        render text: "Страница не найдена", status: 404 
      end
    end
    
    def get_admin
      #if params[:admin]
          @current_user_admin = true
      #end
    end
    
    def check_admin
      render text: "Доступ запрещен", status: 403 unless @current_user_admin
    end 
end
