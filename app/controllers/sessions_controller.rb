class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(email: params[:email])

  	if @user && @user.authenticate(params[:password])
  	  log_in(@user)
  	  redirect_to '/profile'
  	else
  	  flash[:danger] = "Mauvaise combinaison email/mot de passe, rééssaie !"
  	  render :new
  	end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Vous avez bien été déconnecté !"
    redirect_to '/gossips'
  end
end
