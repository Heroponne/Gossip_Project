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
  	  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], age: params[:age], description: params[:description], email: params[:email], password: params[:password])

  	  if @user.save
        redirect_to gossips_path
  	  else
        render :new
        puts @user.errors.messages
  	  end
	end

	def destroy
		
	end
end
