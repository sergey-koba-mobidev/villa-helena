class BookingsController < ApplicationController
  def create
    @booking = Booking.new(allowed_params)

    if verify_recaptcha(model: @booking) && @booking.save
      BookingMailer.with(booking: @booking).new_booking.deliver_later
      respond_to do |f|
        f.html { redirect_to root_path }
        f.js
      end
    else
      respond_to do |f|
        f.html { redirect_to root_path }
        f.js {render 'error'}
      end
    end
  end

  def allowed_params
    params.require(:booking).permit(:full_name, :phone, :email, :date_from, :date_to, :comment)
  end
end