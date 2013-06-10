class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.references :game
      t.boolean :guess
      t.timestamps
    end
  end
end
