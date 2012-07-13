class PollOptionsController < ApplicationController
  def create
    @poll_option = PollOption.new(params[:poll_option])
    if @poll_option.save
      render :json => {:success => true}
    else
      render :json => {:error => true}
    end
  end

  def delete
    PollOption.find(params[:id]).destroy
    render :json => {:success => true}
  end
end
