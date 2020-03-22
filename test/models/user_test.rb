
require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user=User.create(username:'john', email: "john@gmail.com", password:'password')		
		@user=User.new(username:'michal', email: "michal.kanarek@gmail.com", password:'password')
	end


	test "user should be valid"  do
		assert @user.valid?
	end

	test 'username should be presence ' do
		@user.username=''
		assert_not @user.valid?

	end

	test 'email should be presence ' do
		@user.username=''
		assert_not @user.valid?

	end

	test "uername should be unique " do
		@user.username='john'
		assert_not @user.valid?

	end


	test "email should be unique " do
		@user.email='john@gmail.com'
		assert_not @user.valid?

	end




end