class PurchaseController < ApplicationController
  def index
    # @item = Item.find(params[:item_id])
    @purchase = UserDonation.new
  end
 def create 
  @purchase = UserDonation.new(purchase_params)
  if @purchase.valid?
   pay_item
   @purchase.save
    return redirect_to root_path
  else
    render action: :index
  end
 end
    # @purchase = UserDonation.new
    # @purchase.token = "tok_0000000000"
    # puts @purchase.token
    
  private
  # def purchase_params
  #   params.require(:item).permit(:image, :name, :description_item, :category_id, :condition_id, :prefecture_id, :schedule_item_id, :shopping_fee_id, :price)
  # end
  def purchase_params
    params.require(:user_donation).permit(:postal_code,:prefecture_id,:municipality,:address,:building_name,:phone_number,:purchase,:token).merge(token: params[:token])
  end

  def pay_item
  Payjp.api_key = "sk_test_75e5f42138e7299f199ec568"  
    Payjp::Charge.create(
      amount: order_params[:price],  
      card: order_params[:token],   
      currency: 'jpy'                 
    )
  end
end
