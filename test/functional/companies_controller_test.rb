require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  
  setup do
    @supporter = FactoryGirl.create(:supporter)
    @provider = FactoryGirl.create(:provider)
  end

  test "a supporter can view new company form" do
    sign_in @supporter

    get :new, :supporter_id=>@user.id
    
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
      post :create,  :provider=>supporter_attribs
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
      post :create,  :provider=>provider_attribs
    end

    assert_redirected_to dashboard_path
    assert assigns(:user)
    assert_equal "provider", assigns(:company).company_type
  end

  test "should not be able to create company without registered user" do
    get :new

    assert_redirected_to root_path
  end

end
