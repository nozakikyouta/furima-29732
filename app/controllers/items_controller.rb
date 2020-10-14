class ItemsController < ApplicationController
  skip_before_action :authenticate_user!  ,only: [:show, :index]
  before_action :set_item, only: [:show ,:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at ASC')
    # @purchase = Purchase.find(purchase_params)
    # purchase = Purchase.all
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

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render show
    end
  end

  def update
    if @item.update(item_params)
      render:show
    else
      render:edit
    end
  end
  
  def edit
  end

  private

  def item_params
    params.require.permit(:user,:name, :image, :name, :description_item, :category_id, :condition_id, :prefecture_id, :schedule_item_id, :shopping_fee_id, :price).merge(user_id: current_user.id,purchase_id: params[:purchase_id])
  end
  # def purchase_params
  #   params.permit(:user_id,:item_id).merge(purchase_id:params[:purchase_id])
  # end
  def set_item
    @item = Item.find(params[:id])
  end
end