class AccountsController < ApplicationController
	before_action :set_user, only: [:show, :index, :update]
	before_filter :authorize

	def index
	end

	def show
		#puts session[:user_id]
		user_id_from_session = session[:user_id]
		@user = Account.find_by_user_id(user_id_from_session)

	end

	def edit
	   user_id_from_session = session[:user_id]
	   @accounts = Account.all
	   @user = Account.find_by_user_id(user_id_from_session)

	end

	def update
		@accounts = Account.all
		user_id_from_session = session[:user_id]
		@user = Account.find_by_user_id(user_id_from_session)
		
		if @user.update_attributes(user_params)
			flash[:notice] = "Information has been updated."
			redirect_to account_path(@user)
		else
			flash[:notice] = "Error updating user profile."
			render 'edit'
		end
	end

	def login	
	end

	def logout
	end

	private

	def set_user
	   user_id_from_session = session[:user_id]
	   @user = Account.find_by_user_id(user_id_from_session)
	end

	def user_params
		params.require(:account).permit(:first_name,:last_name, :gender, :age)
	end
end
