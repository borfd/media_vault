class AddPublicToMediaItems < ActiveRecord::Migration
  def change
    add_column :media_items, :public, :boolean
  end
end
