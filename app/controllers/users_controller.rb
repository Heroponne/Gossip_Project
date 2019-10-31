class UsersController < ApplicationController
	def index
		
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		
	end

	def new
	end

	def create
  	  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], age: params[:age], city: City.all.sample, description: params[:description], email: params[:email], password: params[:password])

  	  if @user.save
  	  	log_in(@user)
  	  	flash[:success] = "Utilisateur bien créé !"
        redirect_to profile_path
  	  else
  	  	flash[:danger] = @user.errors.messages
        render :new
  	  end
	end

	def destroy
		
	end
end
