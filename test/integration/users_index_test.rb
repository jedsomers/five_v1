require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
 
  def setup
    @admin = users(:jed)
    @non_admin = users(:ben)
  end
  
  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get users_path
    assert_select 'a', text: 'delete'
  end
 
  test "index as non-admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end
 
end
