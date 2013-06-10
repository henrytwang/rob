class Game < ActiveRecord::Base
  attr_accessible :user_id, :score, :over
  belongs_to :user
  has_many :turns
end
