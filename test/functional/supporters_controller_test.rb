require 'test_helper'

class SupportersControllerTest < ActionController::TestCase
  test "a user can view supporter signup form" do
    get :new
    
    assert_response :success
    assert_template :new
    assert assigns(:user)
  end
  
  test "a user can signup as a supporter" do
    
    supporter_attribs = FactoryGirl.attributes_for(:user)
    #print supporter_attribs.inspect
    assert_difference "User.count", 1 do
      post :create, :user=>supporter_attribs
    end

    assert_redirected_to new_company_path
  end
end
