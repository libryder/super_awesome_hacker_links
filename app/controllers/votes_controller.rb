class VotesController < ApplicationController
  before_filter :authenticate_user!

  def create
    if request.xhr?
      link = Link.find(params[:link_id])
  
      if current_user.votes.where(:link_id => params[:link_id]).count == 0
        @vote = current_user.votes.create(link_id: params[:link_id])
        response = { "new_count" => link.votes.count, "has_voted" => false }
      else
        response = { "new_count" => 0, "has_voted" => true }
      end
      
      render :json => response.to_json
    else
      render :text => "Nope."
    end
  end
end
