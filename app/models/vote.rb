class Vote < ActiveRecord::Base
  attr_accessible :poll_option_id, :user_id

  belongs_to :poll_option
  belongs_to :user
end
