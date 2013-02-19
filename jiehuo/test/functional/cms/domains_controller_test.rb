require 'test_helper'

class Cms::DomainsControllerTest < ActionController::TestCase
  setup do
    @cms_domain = cms_domains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cms_domains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cms_domain" do
    assert_difference('Cms::Domain.count') do
      post :create, cms_domain: @cms_domain.attributes
    end

    assert_redirected_to cms_domain_path(assigns(:cms_domain))
  end

  test "should show cms_domain" do
    get :show, id: @cms_domain.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cms_domain.to_param
    assert_response :success
  end

  test "should update cms_domain" do
    put :update, id: @cms_domain.to_param, cms_domain: @cms_domain.attributes
    assert_redirected_to cms_domain_path(assigns(:cms_domain))
  end

  test "should destroy cms_domain" do
    assert_difference('Cms::Domain.count', -1) do
      delete :destroy, id: @cms_domain.to_param
    end

    assert_redirected_to cms_domains_path
  end
end
