class VotesController < ApplicationController
  
  def create
    @vote = Vote.new(params[:vote])
    if @vote.save
      render :json => {:success => true}
    else
      render :json => {:error => true}
    end
  end

  def delete
    Vote.find(params[:id]).destroy
    render :json => {:success => true}
  end
  
end
