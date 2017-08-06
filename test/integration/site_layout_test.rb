require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "home layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]",root_path,count:2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path
  end

  test "signup layout links" do
    get signup_path
    assert_template 'users/new'
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end

  def setup
    @user = users(:michael)
  end

  test "user layout links" do
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
end
