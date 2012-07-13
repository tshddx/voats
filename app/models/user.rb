class User < ActiveRecord::Base
  attr_accessible :cookie

  has_many :polls
  has_many :votes

  before_create do
    self.cookie = UUIDTools::UUID.random_create.to_s
  end
  
end
