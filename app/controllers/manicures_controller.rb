class ManicuresController < ApplicationController
    def index
      @manicures = Manicure.all
      @manicure = Manicure.new
    end

    def create
      @manicure = Manicure.new(manicure_params)

      if @manicure.save
        redirect_to @manicure, notice: 'The manicure has been successfully added.'
      else
        render :new
      end
    end

    def show
      @manicure = Manicure.find(params[:id])
      @booking = @manicure.bookings.new # Создаем новый объект бронирования
    end

    def edit
        @manicure = Manicure.find(params[:id])
    end

    def update
        @manicure = Manicure.find(params[:id])

        if @manicure.update(manicure_params)
          redirect_to @manicure, notice: 'The manicure has been successfully refreshed.'
        else
          render :edit
        end
    end

    def new
      @manicure = Manicure.new
    end

    def destroy
        @manicure = Manicure.find(params[:id])
        @manicure.destroy

        redirect_to manicures_url, notice: 'The manicure has been successfully removed.'
    end

    private

    def manicure_params
      params.require(:manicure).permit(:name, :description, :price)
    end
  end
