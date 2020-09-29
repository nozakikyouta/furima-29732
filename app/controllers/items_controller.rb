class ItemsController < ApplicationController
  
  def index
    @items =Item.all
  end

  def new
    @item= Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @items =Item.all
  end
  def update
    @items =Item.all
  end

  private
  def item_params
    params.require(:item).permit( :image, :name , :description_item, :category_id, :condition_id, :prefecture_id, :schedule_item_id, :shopping_fee_id, :price).merge(user_id: current_user.id)
  end
end

