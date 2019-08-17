class ToDoListsController < ApplicationController
	before_action :set_list, only: [:show, :edit, :update]
	before_filter :authorize

	def index
		user_id_from_session = session[:user_id]
		@user = User.find(user_id_from_session)


		@to_do_lists = @user.to_do_lists.paginate(page: params[:page], per_page: 3)


		@to_do_lists.each do |l|

			# case 1, when to do list has no items
			if l.to_do_items.size == 0
				# hex color red
				l.list_color = "#D10C26"
			else
				# hex color green
				l.list_color = "#227F31"
			end


			# case 2, check if all to do items are complete
			l.to_do_items.each do |i|
				if i.done == false
					# hex color red
					l.list_color = "#D10C26"
				end
			end
		end
    end


    # to_do_list_to_do_item GET  /to_do_lists/:to_do_list_id/to_do_items/:id
	def show
	 	@to_do_list = ToDoList.find(params[:id])
	 	@to_do_items = @to_do_list.to_do_items.paginate(page: params[:page], per_page: 4)

	 	if @to_do_items.size == 0
	 		# color is red 
	 		@tag_color
	 	end
	end

	def new
		@to_do_list = ToDoList.new
	end

	def create
		user_id_from_session = session[:user_id]
		@user = User.find(user_id_from_session)

	    @to_do_list = ToDoList.new(list_params)
	    @user.to_do_lists << @to_do_list
	    
	    if @to_do_list.save
	    	flash[:notice] = "You successfully created a todo list."
	      	flash[:color]= "valid"
	      	redirect_to @to_do_list
	    else
	    	flash[:notice] = "Fail to create a todo list."
	      	flash[:color]= "invalid"
	      	render "to_do_list/:id/new"
	    end
	end

	def edit
	   @to_do_list = ToDoList.find(params[:id])
	end

	def destroy
		@to_do_list = ToDoList.find(params[:id])
  		@to_do_list.destroy
  		redirect_to root_path
	end

	def update
		@to_do_list = ToDoList.find(params[:id])
		if @to_do_list.update_attributes(list_params)
			flash[:notice] = "Todo list has been updated."
			redirect_to to_do_list_path(@to_do_list)
		else
			flash[:notice] = "Error user profile."
			render '/todo_lists/:id/edit'
		end
	end

	private

	def set_list
	    @to_do_list = ToDoList.find(params[:id])
	end

	def set_to_do_item
		@to_do_item = @to_do_list.to_do_items.find(params[:id])	
	end

	def list_params
		params.require(:to_do_list).permit(:list_name, :list_due_date, :list_color, :done)
	end

end
