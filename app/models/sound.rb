class Sound < ActiveRecord::Base
  attr_accessible :filename, :turn_id, :mammal_type
  belongs_to :turn

end
