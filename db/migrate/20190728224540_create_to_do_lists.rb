class CreateToDoLists < ActiveRecord::Migration
  def change
    create_table :to_do_lists do |t|
      t.string :list_name
      t.date :list_due_date
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
      t.string :list_color
    end
  end
end
