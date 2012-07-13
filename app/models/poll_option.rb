class PollOption < ActiveRecord::Base
  attr_accessible :description, :poll_id, :title, :user_id

  belongs_to :poll
  belongs_to :user
end
