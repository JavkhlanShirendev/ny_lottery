require "test_helper"

class LotteriesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get lotteries_create_url
    assert_response :success
  end

  test "should get destroy" do
    get lotteries_destroy_url
    assert_response :success
  end

  test "should get index" do
    get lotteries_index_url
    assert_response :success
  end
end
