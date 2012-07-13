class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def new
  end  
end
