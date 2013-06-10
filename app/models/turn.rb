class Turn < ActiveRecord::Base
  attr_accessible :guess, :game_id

  belongs_to :game
  has_one :sound
end
