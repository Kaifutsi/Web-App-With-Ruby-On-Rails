class PortfolioController < ApplicationController
  def index
    @images = Image.all
  end
end
