class PollOption < ActiveRecord::Base
  attr_accessible :description, :poll_id, :title, :user_id
end
