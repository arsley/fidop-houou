class CreateMahjongGames < ActiveRecord::Migration[7.0]
  def change
    create_table :mahjong_games do |t|
      t.references :east,  null: false, foreign_key: true, type: :uuid
      t.references :south, null: false, foreign_key: true, type: :uuid
      t.references :west,  null: false, foreign_key: true, type: :uuid
      t.references :north, null: true,  foreign_key: true, type: :uuid
      t.integer :east_score,  null: false
      t.integer :south_score, null: false
      t.integer :west_score,  null: false
      t.integer :north_score, null: true
      t.references :match_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
