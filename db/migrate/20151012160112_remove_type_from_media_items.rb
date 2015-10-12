class RemoveTypeFromMediaItems < ActiveRecord::Migration
  def change
    remove_column :media_items, :type, :string
  end
end
