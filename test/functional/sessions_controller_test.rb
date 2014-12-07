require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  fixtures :users

  test "should get login-page" do
    get :new
    assert_response :success
    assert_select 'label', I18n.t('activerecord.attributes.user.nick')
    assert_select 'label', I18n.t('activerecord.attributes.user.pass')
  end

  test "should log-in" do
    post :create, {nick: users(:vasja_good).nick, pass: users(:vasja_good).pass}
    assert_redirected_to users_path
    assert_equal @request.session[:user_id], users(:vasja_good).id
  end

  test "shouldn't log-in" do
    post :create, { nick: "tester_wrong_nick", pass: "100500" }
    assert_redirected_to new_session_path
    assert_equal I18n.t("session.failed-to-login"), flash[:notice]
    assert_equal session[:user_id], nil
  end

  test "should log-out" do
    delete :destroy
    assert_redirected_to new_session_path
    assert_equal session[:user_id], nil
  end
end
