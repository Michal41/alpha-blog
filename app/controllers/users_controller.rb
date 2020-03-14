class UsersController < ApplicationController


	def new
		@user = User.new
	end


	def create
		@user= User.new(user_params)
		if @user.save 
			flash[:success]="user was succesfully created"
			redirect_to articles_path
		else
			flash[:danger]="user is not created"
			render "new"
		end
	end

	def edit
		@user=User.find(params[:id])
	end

	def update
		@user=User.find(params[:id])
		if @user.update(user_params)
			flash[:success]="Your account informaction was succesfully updated"
			redirect_to articles_path
		else
			flash[:danger]="Account not updated"
			render "edit"
		end

	end

	

	def user_params
		params.require(:user).permit(:username, :email, :password)
	end

end
