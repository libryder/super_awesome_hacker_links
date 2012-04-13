class LinksController < ApplicationController
  def index
    @links = LinkDecorator.all.sort_by { |l| l.votes.size.to_i }.reverse
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def edit
    @link = Link.find(params[:id])
  end

  def create
    @link = Link.new(params[:link])

    if @link.save
      redirect_to links_path, notice: 'Link was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @link = Link.find(params[:id])

    if @link.update_attributes(params[:link])
      redirect_to @link, notice: 'Link was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    redirect_to links_path
  end

  def rate
    link = Link.find(params[:id])
    user_session[:voted_links] = [] if user_session[:voted_links].nil?

    if current_user.id == link.user.id
      flash[:error] = "You Can't Vote On Your Own Link!"
      redirect_to links_path
    else
      if user_session[:voted_links] && user_session[:voted_links].include?(link.id)
        flash[:error] = "You've already voted on this link!"
        redirect_to links_path
      else
        link.increment!(:rating)
        user_session[:voted_links] << link.id
        flash[:notice] = "Thanks for voting!"
        redirect_to links_path
      end
    end
  end
end
