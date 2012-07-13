class AddTitleToPoll < ActiveRecord::Migration
  def change
    add_column :polls, :title, :string
  end
end
