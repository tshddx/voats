class VotesController < ApplicationController
  
  def create
    params["poll_options"].each do |id, votes|
      votes.to_i.times do
        v = Vote.create!(:poll_option_id => id, :user_id => @user.id)
        puts "CREATED VOTE"
        puts v.inspect
      end
    end
    render :json => {:success => true}
  end

  def delete
    Vote.find(params[:id]).destroy
    render :json => {:success => true}
  end
end
