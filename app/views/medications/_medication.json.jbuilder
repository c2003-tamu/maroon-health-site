json.extract! medication, :id, :name, :stock, :notes, :created_at, :updated_at
json.url medication_url(medication, format: :json)
