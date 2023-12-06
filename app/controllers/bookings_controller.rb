class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(set_params)
    @booking.user_id = params["booking"][:user_id]
    @booking.product_id = params["booking"][:product_id]


    if @booking.save
      redirect_to bookings_path, notice: "Booking created successfully."
    else
      render 'new'
    end
  end

  def edit
    @booking = Booking.find_by(set_params)
  end

  def update
    @booking = Booking.find_by(set_params)

    if @booking.save
      redirect_to bookings_url, notice: "Booking updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @booking = Booking.find_by(id: params[:id])
    @booking.destroy

    redirect_to bookings_url, notice: "Booking deleted."
  end

  private

  def set_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
