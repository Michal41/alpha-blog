

require 'test_helper'

class SignUpUserTest < ActionDispatch::IntegrationTest

	test "sing up user test" do

		get signup_path
		assert_template 'users/new'
		assert_difference "User.count",1 do
			post users_path params:{user:{username:"michal",password:"password",email:"michal.kanarek@gmail.com"}}
			follow_redirect!
		end
		assert_template 'users/show'
	end






	test "should not signup user with invalid credentials" do

		get signup_path
		assert_template 'users/new'
		assert_no_difference "User.count" do
			post users_path params:{user:{username:"",password:"password",email:""}}
		end
		assert_template 'users/new'
	end

end