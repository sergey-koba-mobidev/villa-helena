class BookingMailer < ApplicationMailer
  default from: Setting.email

  def new_booking
    @booking = params[:booking]
    mail(to: Setting.email, subject: 'Новое бронирование с сайта villa-helena.com')
  end
end
