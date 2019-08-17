class ToDoItemsController < ApplicationController
	before_action :set_to_do_list
	before_action :set_to_do_item, only: [:index, :edit, :destroy,  :show]

	def index
		user_id_from_session = session[:user_id]
		@to_do_list = ToDoList.find_by_user_id(user_id_from_session)
		@to_do_item = ToDoItem.find_by_to_do_list_id(@to_do_list.id).paginate(page: params[:page], per_page: 3)
	end

	def new
		@to_do_item = @to_do_list.to_do_items.new
	end

	  # POST /todo_list/:todo_list_id/todo_items
      # POST /todo_list/:todo_list_id/todo_items.json
  	def create
  		@to_do_list = ToDoList.find(params[:to_do_list_id])
    	@to_do_item = @to_do_list.to_do_items.new(to_do_items_params)
    
	    if @to_do_item.save
	    	flash[:notice] = "You successfully created a todo item."
	      	flash[:color]= "valid"
	      	redirect_to to_do_list_path(@to_do_list)
	    else
	    	flash[:notice] = "Fail to create a todo item."
	      	flash[:color]= "invalid"
	      	render "/to_do_list/:id/to_do_item/:id/new"
	    end

    end


	def edit
		 @to_do_item = @to_do_list.to_do_items.find(params[:id])

	end

	def update
		@to_do_item = @to_do_list.to_do_items.find(params[:id])

		if @to_do_item.update_attributes(to_do_items_params)
			flash[:notice] = "Todo item has been updated."
			redirect_to to_do_list_path(@to_do_list)
		else
			flash[:notice] = "Error - fail to update item."
			render @to_do_item
		end

	end

	def destroy
		@to_do_list = ToDoList.find(params[:to_do_list_id])
		@to_do_item = @to_do_list.to_do_items.find(params[:id])
  		@to_do_item.destroy
  		redirect_to @to_do_list
	end

	def show
		# user_id_from_session = session[:user_id]
		# @to_do_list = ToDoList.find_by_user_id(user_id_from_session)
		# @to_do_item = ToDoItem.find_by_to_do_list_id(@to_do_list.id)
		@to_do_item = @to_do_list.to_do_items.find(params[:id])

	end

	private

		def set_to_do_list
			@to_do_list = ToDoList.find(params[:to_do_list_id])
		end

		def set_to_do_item
			@to_do_item = @to_do_list.to_do_items.find(params[:id])
			
		end

		def to_do_items_params
			params.require(:to_do_item).permit(:task_title, :due_date, :description, :done)
		end
end
