class ItemsController < ApplicationController
  def create
    @items = Item.all
  end
  
  def index
    @items = Item.all
  end

  def show
  end
end
