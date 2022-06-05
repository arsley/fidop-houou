require "test_helper"

class MahjongJansousControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mahjong_jansou = mahjong_jansous(:one)
  end

  test "should get index" do
    get mahjong_jansous_url, as: :json
    assert_response :success
  end

  test "should create mahjong_jansou" do
    assert_difference("MahjongJansou.count") do
      post mahjong_jansous_url, params: { mahjong_jansou: { address: @mahjong_jansou.address, google_map_url: @mahjong_jansou.google_map_url, name: @mahjong_jansou.name, note: @mahjong_jansou.note } }, as: :json
    end

    assert_response :created
  end

  test "should show mahjong_jansou" do
    get mahjong_jansou_url(@mahjong_jansou), as: :json
    assert_response :success
  end

  test "should update mahjong_jansou" do
    patch mahjong_jansou_url(@mahjong_jansou), params: { mahjong_jansou: { address: @mahjong_jansou.address, google_map_url: @mahjong_jansou.google_map_url, name: @mahjong_jansou.name, note: @mahjong_jansou.note } }, as: :json
    assert_response :success
  end

  test "should destroy mahjong_jansou" do
    assert_difference("MahjongJansou.count", -1) do
      delete mahjong_jansou_url(@mahjong_jansou), as: :json
    end

    assert_response :no_content
  end
end
