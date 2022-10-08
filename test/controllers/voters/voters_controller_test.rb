require 'test_helper'

class Voters::VotersControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get voters_voters_index_url
    assert_response :success
  end
end
