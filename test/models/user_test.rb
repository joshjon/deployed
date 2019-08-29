require 'test_helper'

class UserTest < ActiveSupport::TestCase
	
	def setup
		@user = User.new(username: "gerald_lim", password: "password1232", password_confirmation: "password1232")
	end
	
	# test "should be valid" do
	# 	assert @user.valid?
	# end
	
	test "name should be present" do
		@user.username = "  "
		assert_not @user.valid?
	end
	
	test "passsword should be present" do
		@user.password = "  "
		assert_not @user.valid?
	end
	
	test "usernames should be unique" do
		duplicate_user = @user.dup
		@user.save
		assert_not duplicate_user.valid?
	end
	
	test "password should be present (nonblank)" do
		@user.password = @user.password_confirmation = " " * 6
		assert_not @user.valid?
	end
end