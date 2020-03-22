require 'test_helper'


class UsersControllerTest <  ActionDispatch::IntegrationTest

	
	def setup
		@user1=User.create(username:'john', email: "john@gmail.com", password:'password')
		@user2=User.create(username:'michal', email: "michal.kanarek@gmail.com", password:'password')

	end


	test "should get users index" do

		get users_path
		assert_response :success

	end




	test "should get users new" do
		get signup_path
		assert_response :success
	end




	test "should get categories show" do
	  get user_path(@user1)
	  assert_response :success
	 end

	test "should redirect when trying to edit account information another user" do
		sign_in_as(@user1,"password")
		get edit_user_path(@user2)
		assert_redirected_to root_path
	end






end