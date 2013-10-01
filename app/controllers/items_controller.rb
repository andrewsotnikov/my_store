#encoding: windows-1251
class ItemsController < ApplicationController
  before_filter :access_admin, only: [:new, :edit, :create, :update, :destroy]
  before_filter :find_item, only: [:show, :edit, :update, :destroy, :upvote]
  
  # /items GET
  def index
    @items = Item.all
    #render text: @items.map { |i| "#{i.id} = #{i.name}: #{i.price} руб" }.join("<br/>") 
  end
  
  def expensive
    @items = Item.where("price > 1000")
    render :index
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
      render :new
    end
  end
  
  # /items/1 PUT
  def update
    @item.update_attributes(params_item)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render :edit
    end 
  end
  
  # /items/1 DELETE
  def destroy
    @item.destroy
    if @item.errors.empty?
      redirect_to items_path
    else
      redirect_to item_path(@item)
    end
  end
  
  def upvote
    @item.increment!(:votes_count)
    redirect_to items_path
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
      @item = Item.where(id: params[:id]).first
      render_404 unless @item 
    end

end
