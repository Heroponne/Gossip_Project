class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @comment = Comment.new(content: params[:content], user: User.first, gossip: Gossip.find(params[:gossip_id]))
    puts params.inspect
    if @comment.save
      redirect_to gossip_path(params[:gossip_id])
    else
      render :new
      puts @comment.errors.messages
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
