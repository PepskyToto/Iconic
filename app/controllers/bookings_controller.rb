class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
    @product_id = params[:product_id]
  end

  def create
    product_id = params["booking"][:product_id]
    @booking = Booking.new(set_params)
    @booking.user_id = current_user.id
    start_date= params["booking"][:start_date]
    end_date= params["booking"][:end_date]
    #@booking.product_id = params["booking"][:product_id]
    start_date_comparision = Date.parse(start_date)
    if end_date < start_date
      redirect_to product_path(product_id), notice: "End date must be after start date."
    elsif start_date_comparision < Date.today
      redirect_to product_path(product_id), notice: "Start date must be after today."
    elsif @booking.save
      redirect_to root_path, notice: "Booking created successfully."
    else
      redirect_to new_user_session_path, alert: "Booking creation failed. Please log in."
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
    params.require(:booking).permit(:start_date, :end_date, :product_id)
  end
end
