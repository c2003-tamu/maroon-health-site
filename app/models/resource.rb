# frozen_string_literal: true

class Resource < ApplicationRecord
  validates :url, presence: true
  validates :title, presence: true
  validates :description, presence: true
end
