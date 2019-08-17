User.delete_all
Account.delete_all
ToDoList.delete_all
ToDoItem.delete_all

# IMPORTANT: 
# for has_one, user.create_[modelname]
# for has_many, user.[modelname].create
# https://stackoverflow.com/questions/18505471/undefined-method-create-for-nil-class

# create example user for assignment 7
User.create(login: 'Matt', password: 'abc123')
matt = User.find_by_login('Matt')
matt.create_account(gender: 'male', age: 22, first_name: 'Matt', last_name: 'Getz')

# create example user for assignment 7
User.create(login: 'Tim', password: 'abc123')
tim = User.find_by_login('Tim')
tim.create_account(gender: 'male', age: 25, first_name: 'Tim', last_name: 'Burton')

# make lists for tim
ToDoList.create(list_name: "House Dinner List", list_due_date: "2019-9-05T01:29:18")
tim.to_do_lists << ToDoList.last
tim_list_dinner = tim.to_do_lists.find_by_list_name("House Dinner List")

ToDoItem.create(task_title: "create a fb event", due_date:"2019-8-01T02:08:00")
tim_list_dinner.to_do_items << ToDoItem.last

ToDoItem.create(task_title: "send invite to friends", due_date:"2019-8-02T02:12:00")
tim_list_dinner.to_do_items << ToDoItem.last

ToDoItem.create(task_title: "buy groceries", due_date:"2019-8-20T12:20:00")
tim_list_dinner.to_do_items << ToDoItem.last


# make another list for tim
ToDoList.create(list_name: "Road Trip List", list_due_date: "2019-9-05T01:29:18")
tim.to_do_lists << ToDoList.last
tim_list_trip= tim.to_do_lists.find_by_list_name("Road Trip List")

ToDoItem.create(task_title: "drive to Montana", due_date:"2020-5-01T02:08:00")
tim_list_trip.to_do_items << ToDoItem.last

ToDoItem.create(task_title: "pick up friend at Baltimore", due_date:"2019-12-5T02:12:00")
tim_list_trip.to_do_items << ToDoItem.last

ToDoItem.create(task_title: "camp at Arcadia", due_date:"2020-7-15T12:20:00")
tim_list_trip.to_do_items << ToDoItem.last

#create user 3
# User.create(login: 'ann123', password: 'pw123')
# anh = User.find_by_login('ann123')
# anh.create_account(gender: 'female', age: 30, first_name: 'Ann', last_name: 'Hoang')

#create user 4
# User.create(login: 'raul567', password: 'pw567')
# raul = User.find_by_login('raul567')
# raul.create_account(gender: 'male', age: 99, first_name: 'Raul', last_name: 'X.')

# create some to do lists and bind to user anh
ToDoList.create(list_name: "Weekend Chores", list_due_date: "2019-9-01T01:29:18")
# add weekend chores list to user anh's to do list
matt.to_do_lists << ToDoList.last

# add some items to anh weekend chores list
matt_weekend_chores = matt.to_do_lists.find_by_list_name("Weekend Chores")

ToDoItem.create(task_title: "do laundry", due_date:"2019-8-01T05:21:00")
matt_weekend_chores.to_do_items << ToDoItem.last

ToDoItem.create(task_title: "finish rails homework", due_date:"2019-8-01T02:20:00")
matt_weekend_chores.to_do_items << ToDoItem.last

tdL = ToDoList.last
tdL.to_do_items


t = Tag.create(tag_name:"Code")
tdI = ToDoItem.last
tdI.tags << t
t.to_do_items << tdI
t1 = Tag.create(tag_name:"Ruby")
tdI.tags << t1


#TodoItem.create(task_title: 'feed cat', description: 'give wet food to kitty in the morning', due_date: '2019-9-01T01:29:18' )


# Let's create some more to do list for matt but with a consise way: 
matt.to_do_lists.create(list_name: "my august reading list", list_due_date: "2019-8-01T01:12:00")
matt.to_do_lists.create(list_name: "groceries list", list_due_date: "2019-10-01T01:12:00")

# find raul's groceries list
matt_groceries_list = matt.to_do_lists.find_by_list_name("groceries list")
matt_reading_list = matt.to_do_lists.find_by_list_name("my august reading list")

ToDoItem.create(task_title: "Travel with Charlie in Search of America", due_date:"2019-08-01T01:29:18")
matt_reading_list.to_do_items << ToDoItem.last

ToDoItem.create(task_title: "The Inferno", due_date:"2019-8-28T02:29:18")
matt_reading_list.to_do_items << ToDoItem.last

# create a grocery item and save to raul's groceries list
ToDoItem.create(task_title: "buy milk", due_date:"2019-8-21T01:08:18")
matt_groceries_list.to_do_items << ToDoItem.last

ToDoItem.create(task_title: "buy eggs", due_date:"2019-8-20T01:08:18")
matt_groceries_list.to_do_items << ToDoItem.last

ToDoItem.create(task_title: "buy more dog food", due_date:"2019-12-01T01:29:18")
matt_groceries_list.to_do_items << ToDoItem.last