class BookingsController < ApplicationController
  before_action :authenticate_admin, only: [:all_bookings]

  def index
    @manicure = Manicure.find(params[:manicure_id])
    @bookings = @manicure.bookings
  end

  def create
    @manicure = Manicure.find(params[:manicure_id])
    @booking = @manicure.bookings.new(booking_params)
    if @booking.save
      flash[:success] = 'Booking successfully created.'
      redirect_to manicures_path
    else
      render 'manicures/show'
    end
  end

  def all_bookings
    @bookings = Booking.all
  end

  private

  def authenticate_admin
    unless current_user&.admin?
      flash[:alert] = 'Access denied. Only admin users can view all bookings.'
      redirect_to root_path
    end
  end

  def booking_params
    params.require(:booking).permit(:name, :email, :booking_date)
  end
end
