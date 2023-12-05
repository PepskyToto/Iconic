class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.user_id = params[:user_id]
    @booking.room_id = params[:room_id]
    @booking.start_date = params[:start_date]
    @booking.end_date = params[:end_date]
    @booking.total_price = params[:total_price]

    if @booking.save
      redirect_to bookings_url, notice: "Booking created successfully."
    else
      render 'new'
    end
  end

  def edit
    @booking = Booking.find_by(id: params[:id])
  end

  def update
    @booking = Booking.find_by(id: params[:id])
    @booking.user_id = params[:user_id]
    @booking.room_id = params[:room_id]
    @booking.start_date = params[:start_date]
    @booking.end_date = params[:end_date]
    @booking.total_price = params[:total_price]

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
end
