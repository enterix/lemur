require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: {
                      nick: "testerasd",
                      pass: "pass123ssss",
                      email: "tester@vasja.com",
                      "birth(1i)".to_sym => 1990,
                      "birth(2i)".to_sym => 3,
                      "birth(3i)".to_sym => 10,
                      lang: 3 }
    end
    assert_equal [], assigns(:user).errors.full_messages
    assert_redirected_to user_path(assigns(:user))
  end

  # test "should show user" do
  #   get :show, id: @user
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @user
  #   assert_response :success
  # end

  # test "should update user" do
  #   #put :update, id: @user, user: {  }
  #   #assert_redirected_to user_path(assigns(:user))
  # end

  # test "should destroy user" do
  #   assert_difference('User.count', -1) do
  #     delete :destroy, id: @user
  #   end
  #
  #   assert_redirected_to users_path
  # end
end
