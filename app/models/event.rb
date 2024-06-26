# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :member_shifts, dependent: :destroy

  validates :title, presence: true
  validates :ideal_volunteers, presence: true, numericality: { only_integer: true, greater_than: -1, less_than: 100 }
  validates :ideal_underclassmen, presence: true, numericality: { only_integer: true, greater_than: -1, less_than: 100 }
  validates :ideal_upperclassmen, presence: true, numericality: { only_integer: true, greater_than: -1, less_than: 100 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :validate_volunteers?
  validate :end_time_after_start_time?
  validate :event_not_in_the_past?

  def validate_volunteers?
    if conflicting_volunteer_options?
      errors.add(:base, 'You may only choose between opening sign ups for all volunteers or restricting by class, not both.')
    elsif no_volunteer_slot_assigned?
      errors.add(:base, 'At least one volunteer slot must be assigned.')
    end
  end

  def conflicting_volunteer_options?
    ideal_volunteers.positive? && [ideal_underclassmen, ideal_upperclassmen].any?(&:positive?)
  end

  def no_volunteer_slot_assigned?
    [ideal_volunteers, ideal_underclassmen, ideal_upperclassmen].all?(&:zero?)
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
    when 'M1', 'M2'
      self.ideal_underclassmen -= 1
      save!
    when 'M3', 'M4'
      self.ideal_upperclassmen -= 1
      save!
    else
      true
    end
  end

  def increment_class(member)
    case member.class_year
    when 'M1', 'M2'
      self.ideal_underclassmen += 1
      save!
    when 'M3', 'M4'
      self.ideal_upperclassmen += 1
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
    ideal_underclassmen.positive? || ideal_upperclassmen.positive?
  end

  def can_sign_up_class?(member)
    case member.class_year
    when 'M1', 'M2'
      ideal_underclassmen.positive?
    when 'M3', 'M4'
      ideal_upperclassmen.positive?
    else
      true
    end
  end
end
