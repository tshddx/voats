class PollOption < ActiveRecord::Base
  attr_accessible :description, :poll_id, :title, :user_id, :poll, :user

  belongs_to :poll
  belongs_to :user
  
  validates :poll_id, :user_id, :description, :presence => true
end
