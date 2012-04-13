class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  before_filter :check_for_id, :only => [:index, :new]

  def index
    @link = Link.find(params[:link_id])
    @comments = Comment.where(:link_id => @link.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to "/links/#{@comment.link.id}/comments", notice: 'Comment was successfully created.' }
        format.json { render json: comments_path, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def check_for_id
    if params[:link_id].blank?
      redirect_to root_path
    end
  end
end
