class CalendarEvent < ApplicationRecord
    validates :title, :description, :start_datetime, :end_datetime, presence: true
    validate :end_datetime_after_start_datetime
  
    private
  
    def end_datetime_after_start_datetime
      return if end_datetime.blank? || start_datetime.blank?
  
      errors.add(:end_datetime, 'must be after the start datetime') if end_datetime <= start_datetime
    end
  end
  