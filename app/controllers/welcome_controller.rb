class WelcomeController < ApplicationController
  def show_index
  	@gossips = Gossip.all
  end
end
