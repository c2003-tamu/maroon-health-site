json.extract! medication_transaction, :id, :medication_id, :member_id, :amount, :created_at, :updated_at
json.url medication_transaction_url(medication_transaction, format: :json)
