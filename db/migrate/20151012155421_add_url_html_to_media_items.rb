class AddUrlHtmlToMediaItems < ActiveRecord::Migration
  def change
    add_column :media_items, :url_html, :text
  end
end
