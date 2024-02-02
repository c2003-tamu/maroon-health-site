class MedicationTransaction < ApplicationRecord
  belongs_to :medication
  belongs_to :member
end
