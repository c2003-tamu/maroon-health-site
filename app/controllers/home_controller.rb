include ActionView::Helpers::NumberHelper

class HomeController < ApplicationController
  def index
    @photo_files = Dir.glob('app/assets/images/gallery/*')

    # set patients_served to be a function of time passed.
    patient_served_per_day = 100
    start_of_year = DateTime.new(2024, 1, 1)
    days_since = (DateTime.now - start_of_year) # this is a float
    patients_count = (patient_served_per_day * days_since).to_i
    @patients_served = number_with_delimiter(patients_count) # add commas
  end
end
