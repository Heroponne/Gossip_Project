class GossipsController < ApplicationController
  def index
  	@gossips = Gossip.all
  end

  def show
  	@gossip = Gossip.find(params[:id])
  end

  def new
  end

  def create
  	@gossip = Gossip.new(title: params[:title], content: params[:body], user: User.find(26))

  	if @gossip.save
      render '/gossips/index'
  	else
      render '/gossips/new'
      puts @gossip.errors.messages
  	end
  end

  private

  def post_params 
  	params(:title, :content, user: User.find(26))
  end
end
