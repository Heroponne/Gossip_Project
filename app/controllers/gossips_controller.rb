class GossipsController < ApplicationController
  def index
  end

  def show
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
end
