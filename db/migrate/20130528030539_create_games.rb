class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.integer :bgg_id

      t.timestamps
    end
  end
end
