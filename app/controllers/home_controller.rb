# frozen_string_literal: true

class HomeController < ApplicationController
  include ActionView::Helpers::NumberHelper
  def index
    # set patients_served to be a function of time passed.
    patient_served_per_day = 100
    start_of_clinic = DateTime.new(2019, 1, 1)
    # days since start of clinic, unrounded. this is a float
    days_since = (DateTime.now - start_of_clinic)

    patients_count = Integer(patient_served_per_day * days_since)
    # add commas
    @patients_served = number_with_delimiter(patients_count)
  end

  def photos
    @photo_files = Dir.glob('app/assets/images/gallery/*')
  end
end
