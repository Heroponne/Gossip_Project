class CitiesController < ApplicationController
  def index
  end

  def show
    @city = City.find(params[:id])
  end

  def new
  end

  def create
  end

  def update
  end
end
