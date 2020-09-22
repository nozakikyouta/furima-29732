class ItemsController < ApplicationController
  def create
    @items = Item.all
  end
  
  def index
    @items = Item.all
  end

  def new
    @items =Item.all
  end


  def show
  end

  private
  def message_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
end
