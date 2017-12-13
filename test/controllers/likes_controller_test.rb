require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get update," do
    get likes_update,_url
    assert_response :success
  end

  test "should get path," do
    get likes_path,_url
    assert_response :success
  end

  test "should get destroy," do
    get likes_destroy,_url
    assert_response :success
  end

  test "should get create," do
    get likes_create,_url
    assert_response :success
  end

  test "should get new" do
    get likes_new_url
    assert_response :success
  end

end
