class UsersController < ApplicationController
	def index
		
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		
	end

	def create
		
	end

	def new
		
	end

	def destroy
		
	end
end
