class ItemsController < ApplicationController
  skip_before_action :login_required, only: [:show]
  def index
    @items = Item.includes(:user).order('created_at ASC')
  end

  def new
    @item = Item.new
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description_item, :category_id, :condition_id, :prefecture_id, :schedule_item_id, :shopping_fee_id, :price).merge(user_id: current_user.id)
  end
end
