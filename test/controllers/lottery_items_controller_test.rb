require "test_helper"

class LotteryItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get lottery_items_create_url
    assert_response :success
  end

  test "should get index" do
    get lottery_items_index_url
    assert_response :success
  end

  test "should get show" do
    get lottery_items_show_url
    assert_response :success
  end
end
