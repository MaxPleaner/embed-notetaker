class AddCachedContentToItems < ActiveRecord::Migration
  def change
    add_column :items, :cached_content, :text
  end
end
