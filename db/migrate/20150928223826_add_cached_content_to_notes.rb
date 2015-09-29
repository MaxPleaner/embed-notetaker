class AddCachedContentToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :cached_content, :text
  end
end
