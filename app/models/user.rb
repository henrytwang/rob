class User < ActiveRecord::Base
  attr_accessible :name
  has_many :games

  validates :name, :uniqueness  => { :case_sensitive => false }
end
