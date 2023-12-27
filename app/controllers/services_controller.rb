class ServicesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: @data }
    end
  end

  def description
    @descriptions = {
      classic_manicure: "Classic Manicure: Our classic manicure includes...",
      french_manicure: "French Manicure: The French manicure is known for...",
      gel_manicure: "Gel Manicure: Gel manicures offer a durable...",
      shellac_manicure: "Shellac Manicure: Shellac is a type of nail polish...",
    }
  end

end
