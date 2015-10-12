class AddScrapedTitleToMediaItems < ActiveRecord::Migration
  def change
    add_column :media_items, :scraped_title, :string
  end
end
