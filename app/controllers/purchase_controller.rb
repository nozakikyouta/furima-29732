class PurchaseController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end
 def create 
  @purchase = Purchase.new(purchase_params)
  if @purchase.valid?
   pay_item
   @purchase.save
    return redirect_to root_path
  else
    render'index'
  end
 end
    
  private
  # def purchase_params
  #   params.require(:item).permit(:image, :name, :description_item, :category_id, :condition_id, :prefecture_id, :schedule_item_id, :shopping_fee_id, :price)
  # end
  def purchase_params
    params.require(:purchase).permit(:price).merge(token: params[:token])
  end

  def pay_item
  Payjp.api_key = "sk_test_75e5f42138e7299f199ec568"  
    Payjp::Charge.create(
      amount: order_params[:price],  
      card: order_params[:token],   
      currency: 'jpy'                 
    )
end
