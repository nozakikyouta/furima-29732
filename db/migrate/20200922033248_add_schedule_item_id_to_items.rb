class AddScheduleItemIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :schedule_item_id, :integer
  end
end
