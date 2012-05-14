require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  
  setup do
    @supporter = FactoryGirl.create(:supporter,:view_type=>"supporter")
    @provider = FactoryGirl.create(:provider,:view_type=>"provider")
  end

  test "a supporter can view new company form" do
    sign_in @supporter

    get :new
    
    assert_response :success
    assert_template :new
    assert assigns(:user)
    assert assigns(:company)
  end

  test "a supporter can create a company" do
    sign_in @supporter

    supporter_attribs = FactoryGirl.attributes_for(:supporter_company)
    supporter_attribs[:address_attributes] = FactoryGirl.attributes_for(:address)

    assert_difference "Company.count", 1 do
      post :create,  :company=>supporter_attribs
    end

    assert_redirected_to dashboard_path
    assert assigns(:user)
    assert_equal "supporter",assigns(:company).company_type

  end
  
  test "a provider can create a company" do
    sign_in @provider

    provider_attribs = FactoryGirl.attributes_for(:provider_company)
    provider_attribs[:address_attributes] = FactoryGirl.attributes_for(:address)

    assert_difference "Company.count", 1 do
      post :create, :company=>provider_attribs
    end

    assert_redirected_to dashboard_path
    assert assigns(:user)
    assert_equal "provider", assigns(:company).company_type
  end

  test "should not be able to create company without registered user" do
    get :new

    assert_redirected_to new_user_session_path
  end

end
