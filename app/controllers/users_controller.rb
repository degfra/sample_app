class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

  def new
  @user = User.new
  end
  
  def create
		@user = User.new(params[:user])
			if @user.save
				# Handle a successful save, with success message.
				flash[:success] = "Welcome to the Sample App!"
				redirect_to @user		# @user is equivalent to: user_path(user) 
			else
				render 'new' # = NAME OF THE TEMPLATE
			end
  end
  
end
