class AddVotesPerPollOptionToPoll < ActiveRecord::Migration
  def change
    add_column :polls, :votes_per_poll_option, :integer
  end
end
