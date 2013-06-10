class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.references :turn
      t.string :filename
      t.string :mammal_type
      t.timestamps
    end
  end
end
