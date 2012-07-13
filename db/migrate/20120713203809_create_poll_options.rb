class CreatePollOptions < ActiveRecord::Migration
  def change
    create_table :poll_options do |t|
      t.integer :user_id
      t.integer :poll_id
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
