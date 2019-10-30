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
  	@gossip = Gossip.new(title: params[:title], content: params[:content], user: User.first)

  	if @gossip.save
      render :index
  	else
      render :new
      puts @gossip.errors.messages
  	end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title, :content)
    if @gossip.update(gossip_params)
      redirect_to gossips_path
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    render :index
  end

  private

  def post_params 
  	params(:title, :content, user: User.find(26))
  end
end
