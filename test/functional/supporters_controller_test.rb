require 'test_helper'

class SupportersControllerTest < ActionController::TestCase
  test "a user can view supporter signup form" do
    get :new
    
    assert_response :success
    assert_template :new
    assert assigns(:supporter)
  end
  
  test "a user can signup as a supporter" do
    
    supporter_attribs = FactoryGirl.attributes_for(:supporter_company)
    
    assert_difference "Supporter.count", 1 do
      post :create, :supporter=>{}
    end
    assert_redirected_to supporter_path(assigns(:supporter))
  end
end
