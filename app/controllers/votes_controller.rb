class VotesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @vote = current_user.votes.create(link_id: params[:link_id])
    flash[:notice] = "Thanks for voting!"

    redirect_to links_path
  end
end
