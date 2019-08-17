class ToDoList < ActiveRecord::Base
  belongs_to :user
  has_many   :to_do_items

  #validates :list_name, presence: true
end
