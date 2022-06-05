class CreateAdministrators < ActiveRecord::Migration[7.0]
  def change
    create_table :administrators do |t|
      t.string :userid
      t.string :password_digest

      t.timestamps
    end
  end
end
