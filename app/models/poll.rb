class Poll < ActiveRecord::Base
  attr_accessible :user_id, :user

  has_many :poll_options
  belongs_to :user

  validates :user_id, :votes_per_user, :user_id, :presence => true

  def voters
    return User.find_by_sql("SELECT * FROM users, votes, poll_options ON users.id = votes.user_id AND poll_options.id = votes.poll_option_id WHERE poll_options.poll_id = #{self.id.to_i} GROUP BY users.id")
  end

  def votes
    return Vote.find_by_sql("SELECT * FROM votes, poll_options ON votes.poll_option_id = poll_options.id WHERE poll_options.poll_id = #{self.id.to_i}")
  end

  def votes_remaining(user=nil)
    if user.nil?
      return (self.votes_per_user * voters.count) - self.votes.count
    else
      return self.votes_per_user - Vote.count_by_sql("SELECT COUNT(*) FROM votes, users, poll_options ON votes.user_id = users.id AND votes.poll_option_id = poll_options.id WHERE poll_options.poll_id = #{self.id.to_i} AND users.id = #{user.id}")
    end
  end

  def ranked_poll_options
    sql = <<SQL
SELECT poll_options.id, poll_options.description, COUNT(votes.id) AS vote_count
FROM poll_options
LEFT OUTER JOIN votes
ON votes.poll_option_id = poll_options.id
WHERE poll_options.poll_id = #{self.id.to_i}
GROUP BY poll_options.id
ORDER BY vote_count DESC;
SQL

    return PollOption.find_by_sql(sql)
  end

end
