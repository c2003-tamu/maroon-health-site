# frozen_string_literal: true

class Event < ApplicationRecord
    has_many :member_shifts

    validates :title, presence: true
    validates :ideal_volunteers, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 100 }
    validates :ideal_officers, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 10 }
    validates :start_time, presence: true
    validates :end_time, presence: true
    validate :end_time_after_start_time?
    validate :event_not_in_the_past?

    def can_sign_up?
        ideal_volunteers > 0
    end

    def registered?(member)
        MemberShift.exists?(member_id: member.id, event_id: id)
    end

    def end_time_after_start_time?
        if start_time >= end_time
            errors.add(:end_time, "must be after the start time")
        end
    end

    def event_not_in_the_past?
        if end_time < Time.now
            errors.add(:end_time, "cannot be in the past")
        end
    end
end
