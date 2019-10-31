class GossipsController < ApplicationController

  before_action :authenticate_user, only: [:new, :create]
  before_action :authenticate_user_and_owner_of_gossip, only: [:edit, :update, :destroy]

  def index
  	@gossips = Gossip.all
  end

  def show
  	@gossip = Gossip.find(params[:id])
  end

  def new
  end

  def create
  	@gossip = Gossip.new(title: params[:title], content: params[:content], user: current_user)

  	if @gossip.save
      flash[:success] = "Potin bien créé !"
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

# méthode qui eprmet de vérifier qu'on a l'utilisateur qui est log  
  def authenticate_user
    unless current_user
      flash[:danger] = "Merci de te connecter pour effectuer ceci !"
      redirect_to new_session_path
    end
  end

# méthode qui permet de vérifier qu'on a à la fois l'utilisateur qui est log et qu'il est bien auteur du gossip
  def authenticate_user_and_owner_of_gossip
    @gossip = Gossip.find(params[:id])
    unless current_user && @gossip.user.id == current_user.id
      flash[:danger] = "Vous ne pouvez pas modifier ou supprimer un potin que vous n'avez pas créé."
      redirect_to gossips_path
    end
  end 

end
