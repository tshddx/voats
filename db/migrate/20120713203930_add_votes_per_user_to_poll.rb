class AddVotesPerUserToPoll < ActiveRecord::Migration
  def change
    add_column :polls, :votes_per_user, :integer
  end
end
