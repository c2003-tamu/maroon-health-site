class HomeController < ApplicationController
  def index
    @photo_files = Dir.glob('app/assets/images/gallery/*')

    # set patients_served to be a function of time passed.
    patient_served_per_day = 100
    start_of_year = DateTime.new(2024, 1, 1)
    days_since = (DateTime.now - start_of_year) # this is a float
    @patients_served = (patient_served_per_day * days_since).to_i
  end
end
