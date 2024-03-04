# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :member_shifts, dependent: :destroy

  validates :title, presence: true
  validates :ideal_volunteers, presence: true, numericality: { only_integer: true, greater_than: -1, less_than: 100 }
  validates :ideal_m1, presence: true, numericality: { only_integer: true, greater_than: -1, less_than: 100 }
  validates :ideal_m2, presence: true, numericality: { only_integer: true, greater_than: -1, less_than: 100 }
  validates :ideal_m3, presence: true, numericality: { only_integer: true, greater_than: -1, less_than: 100 }
  validates :ideal_m4, presence: true, numericality: { only_integer: true, greater_than: -1, less_than: 100 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :validate_volunteers?
  validate :end_time_after_start_time?
  validate :event_not_in_the_past?

  def validate_volunteers?
    if ideal_volunteers > 0 && (ideal_m1 > 0 || ideal_m2 > 0 || ideal_m3 > 0 || ideal_m4 > 0)
      errors.add(:base, "You may only choose between opening sign ups for all volunteers or restricting by class, not both.")
    elsif ideal_volunteers == 0 && ideal_m1 == 0 && ideal_m2 == 0 && ideal_m3 == 0 && ideal_m4 == 0
      errors.add(:base, "At least one volunteer slot must be assigned.")
    end
  end

  def decrement_ideal_volunteers
    self.ideal_volunteers -= 1
    save!
  end

  def increment_ideal_volunteers
    self.ideal_volunteers += 1
    save!
  end

  def decrement_class(member)
    case member.class_year
      when 'M1'
        self.ideal_m1 -= 1
        save!
      when 'M2'
        self.ideal_m2 -= 1
        save!
      when 'M3'
        self.ideal_m3 -= 1
        save!
      when 'M4'
        self.ideal_m4 -= 1
        save!
      else
        true
    end
  end

  def increment_class(member)
    case member.class_year
      when 'M1'
        self.ideal_m1 += 1
        save!
      when 'M2'
        self.ideal_m2 += 1
        save!
      when 'M3'
        self.ideal_m3 += 1
        save!
      when 'M4'
        self.ideal_m4 += 1
        save!
      else
        true
    end
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

  def class_select?
    ideal_m1.positive? || ideal_m2.positive? || ideal_m3.positive? || ideal_m4.positive?
  end

  def can_sign_up_class?(member)
    case member.class_year
    when 'M1'
      ideal_m1.positive?
    when 'M2'
      ideal_m2.positive?
    when 'M3'
      ideal_m3.positive?
    when 'M4'
      ideal_m4.positive?
    else
      true
    end
  end
end
