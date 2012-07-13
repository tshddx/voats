class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :poll_option_id
      t.integer :user_id

      t.timestamps
    end
  end
end
