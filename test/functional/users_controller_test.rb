require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new
    asserit assigns(:user)
  end

  test "should be able to signup" do
    user_attribs = FactoryGirl.attributes_for(:supporter)

    get :create
    assert_response :success
  end

end
