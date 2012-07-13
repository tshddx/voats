class Vote < ActiveRecord::Base
  attr_accessible :poll_option_id, :user_id
end
