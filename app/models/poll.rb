class Poll < ActiveRecord::Base
  attr_accessible :user_id, :user

  has_many :poll_options
  belongs_to :user

  validates :user_id, :votes_per_user, :user_id, :presence => true
end
