class AddDescriptionItemToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :description, :text ,null:false
  end
end
