class LinksController < ApplicationController
  def index
    @links = LinkDecorator.all.sort_by { |l| l.votes.size.to_i }.reverse
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])

    if @link.save
      redirect_to links_path, notice: 'Link was successfully created.'
    else
      render action: "new"
    end
  end
end
