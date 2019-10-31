class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(email: params[:email])

  	if @user && @user.authenticate(params[:password])
  	  log_in(@user)
  	  redirect_to '/profile'
  	else
  	  render :new
  	end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/gossips'
  end
end
