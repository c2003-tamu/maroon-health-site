# frozen_string_literal: true

class MemberShift < ApplicationRecord
  validates :title, presence: true
  validates :ideal_volunteers, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :ideal_officers, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :start_time, presence: true
  validates :end_time, presence: true

  validate :start_time_before_end_time
  belongs_to :event
  belongs_to :member

  private

  def start_time_before_end_time
    return unless start_time && end_time

    errors.add(:end_time, 'must be after start time') if end_time <= start_time
  end
end
