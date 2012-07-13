class User < ActiveRecord::Base
  attr_accessible :cookie

  before_create do
    self.cookie = UUIDTools::UUID.random_create.to_s
  end
  
end
