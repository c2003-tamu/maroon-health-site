# frozen_string_literal: true

class MemberShift < ApplicationRecord
  belongs_to :event
  belongs_to :member
end
