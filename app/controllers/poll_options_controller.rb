class PollOptionsController < ApplicationController
  def create
    @poll_option = PollOption.new
    @poll_option.poll_id = params[:poll_id]
    @poll_option.user = @user
    @poll_option.description = params[:description]
    if @poll_option.save
      render :json => {:success => true, :id => @poll_option.id }
    else
      render :json => {:error => true}
    end
  end

  def delete
    PollOption.find(params[:id]).destroy
    render :json => {:success => true}
  end
end
