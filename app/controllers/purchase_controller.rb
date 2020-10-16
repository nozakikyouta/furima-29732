class PurchaseController < ApplicationController
 
  def index
    @item = Item.find(params[:item_id])
    if @item.purchase!=nil || @item.user_id == current_user.id
      redirect_to root_path
    end
    @purchase = UserDonation.new
  end
 def create 
  @purchase = UserDonation.new(purchase_params)
  @item = Item.find(params[:item_id])
  if@purchase.valid?
    pay_item
     @purchase.save
    return redirect_to root_path
  else
    render action: :index
  end
 end

  private
  
    def item_params
      params.permit(:image, :name, :description_item, :category_id, :condition_id, :prefecture_id, :schedule_item_id, :shopping_fee_id, :price,:user_id).merge(user_id: current_user.id)
    end
    def purchase_params
      params.require(:user_donation).permit(:postal_code,:prefecture_id,:municipality,:address,:building_name,:phone_number,:purchase,:token).merge(token: params[:token],user_id:current_user.id, item_id: params[:item_id])
    end

    # def move_to_index
    #   unless purchase_id != nil
    #     redirect_to root_path
    #   end
    # end


  def pay_item
    @item = Item.find(params[:item_id])
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: purchase_params[:token],   
      currency: 'jpy'                 
    )
  end
end
