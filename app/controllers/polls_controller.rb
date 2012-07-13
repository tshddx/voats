class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def create
    @poll = Poll.new(params[:poll])
    if @poll.save
      render :json => {:success => true}
    else
      render :json => {:error => true}
    end
  end

  def delete
    Poll.find(params[:id]).destroy
    render :json => {:success => true}
  end

  def new
  end  
end
