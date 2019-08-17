class UsersController < ApplicationController


	before_filter :authorize

	def new
    end

	def edit
		#puts "-----> session user id: " + session[:user_id].to_s
		user_id_from_session = session[:user_id]
		@user = User.find(user_id_from_session)
		puts "------> @user: " + @user.to_s
	end

	def show
		puts session[:user_id]
		user_id = User.find(params[:id])
		@user = User.find(user_id)

	end

	def create
	  user = User.new(user_params)
	  if user.save
	    session[:user_id] = user.id
	    redirect_to '/'
	  else
	    redirect_to '/signup'
	  end
	end

	private
	
	def user_params
	  params.require(:user).permit(:login, :password, :password_confirmation)
	end


end
