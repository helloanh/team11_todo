class CreateToDoItems < ActiveRecord::Migration
  def change
    create_table :to_do_items do |t|
      t.string :task_title
      t.string :description
      t.date :due_date
      t.references :to_do_list, index: true, foreign_key: true
      t.boolean :done, :default => false

      t.timestamps null: false
    end
  end
end
