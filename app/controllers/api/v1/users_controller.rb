class Api::V1::UsersController < ApplicationController
	
	def login
		@user = User.find_by_email(user_params[:email])
		if @user && @user.authenticate(user_params[:password])
			@user.api_token = User.get_api_token
			@user.save
			render json: {
				message: "User logged in successfully",
				authToken: @user.api_token
			}
		else
			render json: {error: "Invalid email/password"}
		end
	end

	def signup
		@user = new_user
		if @user.save
			render json: {message: "#{@user.name} signed up successfully"}
		else
			render json: {error: @user.errors.full_messages}
		end
	end

	private

	def new_user
		User.new({
				name: user_params[:name],
				email: user_params[:email],
				encrypted_password: User.encrypt_password(user_params[:password])
			})
	end

	def user_params
		params.require(:user).permit(:name,:email,:password)
	end
end
