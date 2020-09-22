class AddShoppingFeeIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :shopping_fee_id, :integer, null:false
  end
end
