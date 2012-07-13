class User < ActiveRecord::Base
  attr_accessible :cookie

  has_many :polls
  has_many :votes

  before_create do
    self.cookie = UUIDTools::UUID.random_create.to_s
  end

  def robohash(size=200)
    # 1 or 2
    set = (self.id % 2) + 1
    return "http://robohash.org/#{self.cookie}.png?set=set#{set}&size=#{size}x#{size}"
  end
  
end
