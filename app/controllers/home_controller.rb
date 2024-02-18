# frozen_string_literal: true

class HomeController < ApplicationController
  include ActionView::Helpers::NumberHelper
  def index
    @photo_files = Dir.glob('app/assets/images/gallery/*')

    # set patients_served to be a function of time passed.
    patient_served_per_day = 100
    start_of_year = DateTime.new(2024, 1, 1)
    # this is a float
    days_since = (DateTime.now - start_of_year)

    patients_count = Integer(patient_served_per_day * days_since)
    # add commas
    @patients_served = number_with_delimiter(patients_count)
  end
end
