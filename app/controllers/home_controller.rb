class HomeController < ApplicationController
  def index
    @gallery = Photo.order(position: :asc).all
    @gallery_circle = Photo.where(circle: true).order(position: :asc).all
    @useful_links = UsefulLink.order(position: :asc).all
    @main_image = Photo.main
    @booking = Booking.new
  end
end