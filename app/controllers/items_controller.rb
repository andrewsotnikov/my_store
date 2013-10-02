#encoding: windows-1251
class ItemsController < ApplicationController
  before_filter :access_admin, only: [:new, :edit, :create, :update, :destroy]
  before_filter :find_item, only: [:show, :edit, :update, :destroy, :upvote]
  
  # /items GET
  def index
    @items = Item
    # @items = @items.where(price: 5000)
    # @items = @items.where(votes_count: 5)
    # @items = @items.where(votes_count: 6, price: 5000)
    # @items = @items.where("votes_count = 6 or price = 5000")
    # @items = @items.where("votes_count = 6 or price >= 1000")
    @items = @items.where("price >= ?", params[:price_from]) if params[:price_from]
    @items = @items.where("created_at >= ?", 15.day.ago) if params[:today] 
    @items = @items.where("votes_count >= ?", params[:votes_from]) if params[:votes_from]
    @items = @items.order("votes_count DESC", :price).limit(50)
    @items = @items.includes(:carts)
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
      flash[:success_item] = "Товар успешно сохранен."
      redirect_to item_path(@item)
    else
      flash.now[:error_item] = "Ошибка заполнения формы. Введите правильные значения."
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
