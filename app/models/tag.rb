class Tag < ActiveRecord::Base
  has_and_belongs_to_many :to_do_items
end
