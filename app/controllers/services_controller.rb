class ServicesController < ApplicationController
  def index
    # Your action logic here

    respond_to do |format|
      format.html # This specifies the HTML format template
      format.json { render json: @data } # Example: respond with JSON
    end
  end

  def description
    # You can fetch descriptions for different services here.
    @descriptions = {
      classic_manicure: "Classic Manicure: Our classic manicure includes...",
      french_manicure: "French Manicure: The French manicure is known for...",
      gel_manicure: "Gel Manicure: Gel manicures offer a durable...",
      shellac_manicure: "Shellac Manicure: Shellac is a type of nail polish...",
    }
  end

  # Other actions (index, show, create, etc.) as needed.
end
