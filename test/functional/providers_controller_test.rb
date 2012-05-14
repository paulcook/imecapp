require 'test_helper'

class ProvidersControllerTest < ActionController::TestCase
  test "a user can view provider signup form" do
    get :new
    
    assert_response :success
    assert_template :new
    assert assigns(:user)
  end
  
  test "a user can signup as a provider" do
    
    provider_attribs = FactoryGirl.attributes_for(:user)
    
    assert_difference "User.count", 1 do
      post :create, :user=>provider_attribs
    end

    assert_redirected_to new_company_path
  end
end
