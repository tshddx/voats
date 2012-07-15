class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def create
    @poll = Poll.new
    @poll.votes_per_user = params[:votes_per_user].to_i
    @poll.votes_per_poll_option = params[:votes_per_poll_option]
    @poll.title = params[:title]
    @poll.user = @user
    if @poll.save
      redirect_to poll_path(@poll)
    else
      render :json => @poll.errors
    end
  end

  def delete
    Poll.find(params[:id]).destroy
    render :json => {:success => true}
  end

  def new
  end  

  def show
    @poll = Poll.find(params[:id])
    if params[:end_now]
      @poll.ended_at = Time.now
      @poll.save
    end
  end
end
