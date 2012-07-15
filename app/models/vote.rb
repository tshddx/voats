class Vote < ActiveRecord::Base
  attr_accessible :poll_option_id, :user_id, :poll_option, :user

  belongs_to :poll_option
  belongs_to :user

  # validate :vote_counts

  def poll
    return self.poll_option.poll
  end

  def vote_counts
    votes = self.user.votes(:poll => self.poll).count
    puts "\n\n#{votes}"
    if votes >= self.poll.votes_per_user
      errors.add("You've used all your votes.")
    end
  end
end
