class Poll < ActiveRecord::Base
  attr_accessible :user_id, :user

  has_many :poll_options
  belongs_to :user

  validates :user_id, :votes_per_user, :user_id, :presence => true

  def voters
    return User.find_by_sql("SELECT * FROM users, votes, poll_options ON users.id = votes.user_id AND poll_options.id = votes.poll_option_id WHERE poll_options.poll_id = #{self.id.to_i} GROUP BY users.id")
  end

  def votes
    return Vote.find_by_sql("SELECT * FROM votes, poll_options ON votes.poll_option_id = poll_options.id WHERE poll_options.poll_id = #{self.id.to_i} GROUP BY votes.id")
  end

  def votes_remaining
    return (self.votes_per_user * voters.count) - self.votes.count
  end
end
