class Api::V1::GamesController < ApplicationController
  before_action :set_game, only: %i[show update destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show; end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    if @game.save
      render :show, status: :created, location: api_v1_game_url(@game)
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    if @game.update(game_params)
      render :show, status: :ok, location: api_v1_game_url(@game)
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params
      .permit(
        :east_id,
        :south_id,
        :west_id,
        :north_id,
        :east_score,
        :south_score,
        :west_score,
        :north_score,
        :match_id
      )
  end
end
