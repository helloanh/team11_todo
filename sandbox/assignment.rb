#!/usr/bin/env ruby

require_relative '../config/environment'
require 'active_record'

# show all users
puts User.last.account


#----- Test Item 4: map TodoLists and TodoItems directory to user ------------------------

#create new user
User.create(login: 'spock123', password: 's123')
# save first user to anh
spock = User.find_by_login('spock123')

# create a new to do list for user anh
spock.to_do_lists.create(list_name: "states left to travel", list_due_date: "2020-12-01T01:12:00")
spock.to_do_lists.create(list_name: "packing list", list_due_date: "2019-10-01T01:12:00")


spock_packing_list = spock.to_do_lists.find_by_list_name("packing list")

# create a packing item and save to anh's packing list
ToDoItem.create(task_title: "sandals", due_date:"2019-11-01T01:29:18")
spock_packing_list.to_do_items << ToDoItem.last


#----- Test Item 5: Validating Account model -----------------------------------------------

# validate gender male, female, or n/a
foo = User.create(login: 'foo', password: 'baz')
account1 = Account.create(gender: 'foobaz', age: 25, first_name: 'Foo', last_name: 'Baz')
foo.account = account1


# validate age as between 20-100
too_old = Account.new(gender: 'N/A', age: 120, first_name: 'Old', last_name: 'Dude')
too_old.save!

#----- Test Item 6: TodoItem and TodoList to return due date in ascending order -------------

# creating sample to do lists with different list due dates
ToDoList.create(list_name: "home renovation list", list_due_date: "2000-9-06T01:10:18")
ToDoList.create(list_name: "plants list", list_due_date: "2020-05-01T01:08:00")
ToDoList.create(list_name: "weekend chores", list_due_date: "2015-08-08T08:15:15")

puts ToDoList.all

# creating sample items and lists with different due dates
ToDoItem.create(task_title: "feed kitty", due_date:"2009-04-05T04:01:42")
ToDoItem.create(task_title: "visit keywest", due_date:"1989-02-01T04:015:56")
ToDoItem.create(task_title: "make tacos", due_date:"2050-07-08T02:07:17")

# shows the due_date from most newest item to oldest item
puts ToDoItem.all

