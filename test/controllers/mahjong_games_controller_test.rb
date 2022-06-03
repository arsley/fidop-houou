require "test_helper"

class MahjongGamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mahjong_game = mahjong_games(:one)
  end

  test "should get index" do
    get mahjong_games_url, as: :json
    assert_response :success
  end

  test "should create mahjong_game" do
    assert_difference("MahjongGame.count") do
      post mahjong_games_url, params: { mahjong_game: { east_id: @mahjong_game.east_id, east_score: @mahjong_game.east_score, match_id_id: @mahjong_game.match_id_id, north_id: @mahjong_game.north_id, north_score: @mahjong_game.north_score, south_id: @mahjong_game.south_id, south_score: @mahjong_game.south_score, west_id: @mahjong_game.west_id, west_score: @mahjong_game.west_score } }, as: :json
    end

    assert_response :created
  end

  test "should show mahjong_game" do
    get mahjong_game_url(@mahjong_game), as: :json
    assert_response :success
  end

  test "should update mahjong_game" do
    patch mahjong_game_url(@mahjong_game), params: { mahjong_game: { east_id: @mahjong_game.east_id, east_score: @mahjong_game.east_score, match_id_id: @mahjong_game.match_id_id, north_id: @mahjong_game.north_id, north_score: @mahjong_game.north_score, south_id: @mahjong_game.south_id, south_score: @mahjong_game.south_score, west_id: @mahjong_game.west_id, west_score: @mahjong_game.west_score } }, as: :json
    assert_response :success
  end

  test "should destroy mahjong_game" do
    assert_difference("MahjongGame.count", -1) do
      delete mahjong_game_url(@mahjong_game), as: :json
    end

    assert_response :no_content
  end
end
