class CreateTagsToDoItems < ActiveRecord::Migration
  def change
    create_table :tags_to_do_items, id:false do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :to_do_item, index: true, foreign_key: true
    end
  end
end
