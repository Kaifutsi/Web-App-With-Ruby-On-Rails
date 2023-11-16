class LikesController < ApplicationController
  def create
    @image = Image.find(params[:image_id])
    @like = @image.likes.build(user: current_user)

    if @like.save
      flash[:success]
    else
      flash[:error] = 'Could not like the image.'
    end

    redirect_to portfolio_path
  end

  def destroy
    @image = Image.find(params[:image_id])
    @like = @image.likes.find_by(id: params[:id])

    if @like
      @like.destroy
      flash[:success]
    else
      flash[:error] = 'Like not found or could not be removed.'
    end

    redirect_to portfolio_path
  end
end
