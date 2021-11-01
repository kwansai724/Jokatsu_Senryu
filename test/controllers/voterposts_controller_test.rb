require 'test_helper'

class VoterpostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get voterposts_index_url
    assert_response :success
  end

  test "should get create" do
    get voterposts_create_url
    assert_response :success
  end

  test "should get destroy" do
    get voterposts_destroy_url
    assert_response :success
  end

end
