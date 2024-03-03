# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :member_shifts, dependent: :destroy

  validates :title, presence: true
  validates :ideal_volunteers, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 100 }
  validates :m1_m2_volunteers, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: :ideal_volunteers }
  validates :m3_m4_volunteers, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: :ideal_volunteers }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time?
  validate :event_not_in_the_past?

  def decrement_ideal_volunteers
    self.ideal_volunteers -= 1
    save!
  end

  def increment_ideal_volunteers
    self.ideal_volunteers += 1
    save!
  end

  def decrement_m1_m2
    self.m1_m2_volunteers -= 1
    save!
  end

  def increment_m1_m2
    self.m1_m2_volunteers += 1
    save!
  end

  def decrement_m3_m4
    self.m3_m4_volunteers -= 1
    save!
  end

  def increment_m3_m4
    self.m3_m4_volunteers += 1
    save!
  end

  def can_sign_up?
    ideal_volunteers.positive?
  end

  def registered?(member)
    MemberShift.exists?(member_id: member.id, event_id: id)
  end

  def end_time_after_start_time?
    errors.add(:end_time, 'must be after the start time') if start_time >= end_time
  end

  def event_not_in_the_past?
    errors.add(:end_time, 'cannot be in the past') if end_time < Time.zone.now
  end
  
end
