class AddEndedAtToPoll < ActiveRecord::Migration
  def change
    add_column :polls, :ended_at, :timestamp
  end
end
