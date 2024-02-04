# frozen_string_literal: true

json.array!(@medication_transactions, partial: 'medication_transactions/medication_transaction', as: :medication_transaction)
