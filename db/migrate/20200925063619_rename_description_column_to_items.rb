class RenameDescriptionColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :description, :description_item
  end
end
