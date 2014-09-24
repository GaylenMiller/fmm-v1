require 'test_helper'

class UserTest < ActiveSupport::TestCase
	
  test "User_count" do
      assert_equal 2, User.count
  end

  test "a user should a first name and last name" do
  	user = User.new
  	user.display_name_lower = 'gator36a'
  	user.email = 'abcd@123.com'
  	user.password = '12345678'
  	assert !user.save
  	assert !user.errors[:first_name].empty?, 'user should have an error on first name blank'
  	assert !user.errors[:last_name].empty?, 'user should have an error on last name blank'
  	assert !user.errors[:display_name].empty?, 'user should have an error on password blank'
  end

  test "a user name should not be too long" do
  	user = users(:gaylen).dup # close the :gaylen user
  	user.first_name = 'x' * 100
  	assert user.first_name != users(:gaylen).first_name
  	assert !user.save
  	emessage = user.errors[:first_name][0] # errors is a hash of arrays
  	assert emessage.include? "is too long"
  end

  test "a user should have a unique email" do
  	user = User.new
  	user.first_name = 'x'
  	user.last_name = 'x'
  	user.display_name = 'x'
  	user.password = '12345678'
    user.display_name_lower = users(:shelley).display_name_lower
    user.email = users(:shelley).email
  	assert !user.save
    #puts user.errors.inspect
  	assert !user.errors[:email].empty?, 'user should have an error on email non-uniqueness'
  	assert !user.errors[:display_name_lower].empty?, 'user should have an error on display name non-uniqueness'
  end

	# add tests with bad emails.
end
