require 'test_helper'

class ProvidersControllerTest < ActionController::TestCase
  
  test "a user can view provider signup form" do
    get :new
    
    assert_response :success
    assert_template :new
    assert assigns(:provider)
  end
  
  test "a user can signup as a provider" do
    
    provider_attribs = FactoryGirl.attributes_for(:provider_company)
    
    assert_difference "Provider.count", 1 do
      post :create, :provider=>{}
    end
    assert_redirected_to provider_path(assigns(:provider))
  end
end
