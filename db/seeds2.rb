User.delete_all
Account.delete_all
ToDoList.delete_all
Todoitem.delete_all

# IMPORTANT: 
# for has_one, user.create_[modelname]
# for has_many, user.[modelname].create
# https://stackoverflow.com/questions/18505471/undefined-method-create-for-nil-class


#create user 1
User.create(login: 'ann123', password: 'pw123')
anh = User.find_by_login('ann123')
anh.create_account(gender: 'female', age: 30, first_name: 'Ann', last_name: 'Hoang')

#create user 2
User.create(login: 'raul567', password: 'pw567')
raul = User.find_by_login('raul567')
raul.create_account(gender: 'male', age: 99, first_name: 'Raul', last_name: 'X.')

# view anh's todo lists, should have nothing so far
anh.to_do_lists

# create some to do lists and bind to user anh
ToDoList.create(list_name: "weekend chores", list_due_date: "2019-9-01T01:29:18")
# add weekend chores list to user anh's to do list
anh.to_do_lists << ToDoList.last

ToDoList.create(list_name: "homework checklist", list_due_date: "2019-9-01T01:29:18")
# add homework checklist to user anh's to do list
anh.to_do_lists << ToDoList.last

# Let's create some more to do list for raul but with a consise way: 
raul.to_do_lists.create(list_name: "my august reading list", list_due_date: "2019-8-01T01:12:00")
raul.to_do_lists.create(list_name: "groceries list", list_due_date: "2019-10-01T01:12:00")

# view raul's todo lists, should have 2 lists
raul.to_do_lists

# find raul's groceries list
raul_groceries_list = raul.to_do_lists.find_by_list_name("groceries list")

# create a grocery item and save to raul's groceries list
ToDoItem.create(task_title: "buy milk", due_date:"2019-11-01T01:29:18")
raul_groceries_list.to_do_items << ToDoItem.last

# PART 2: Create a new to do items


#---- create new todo item
Todoitem.create(task_title: "read travel with charlie book", description: "steinbeck last travelogue", due_date: "2021-9-01T01:25:18")
#reading_list << Todoitem.last

Todoitem.create(task_title: "feed cat", description: "feed kitty in the mornign at 8:00am", due_date: "2019-9-01T01:25:18")
#ToDoList.todoitems << Todoitem.last
