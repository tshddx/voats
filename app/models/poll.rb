class Poll < ActiveRecord::Base
  attr_accessible :user_id

  has_many :poll_options
  belongs_to :user
end
