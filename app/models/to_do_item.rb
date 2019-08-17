class ToDoItem < ActiveRecord::Base
  belongs_to :to_do_list
  has_and_belongs_to_many :tags
end
