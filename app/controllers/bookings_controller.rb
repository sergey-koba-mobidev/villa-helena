class BookingsController < ApplicationController
  def create
    @booking = Booking.create!(allowed_params)
    BookingMailer.with(booking: @booking).new_booking.deliver_later

    respond_to do |f|
      f.html { redirect_to root_path }
      f.js
    end
  end

  def allowed_params
    params.require(:booking).permit(:full_name, :phone, :email, :date_from, :date_to, :comment)
  end
end