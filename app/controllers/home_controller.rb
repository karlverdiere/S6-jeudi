class HomeController < ApplicationController

  def index
  	@crypto = Crypto.new
  
  end

  def show
  	@crypto = Crypto.find(params[:crypto][:id])
  end

end
