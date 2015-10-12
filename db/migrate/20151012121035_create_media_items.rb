class CreateMediaItems < ActiveRecord::Migration
  def change
    create_table :media_items do |t|
      t.integer :user_id
      t.string :url
      t.string :type

      t.timestamps null: false
    end
  end
end
