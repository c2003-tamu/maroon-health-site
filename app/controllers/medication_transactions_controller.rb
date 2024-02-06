# frozen_string_literal: true

class MedicationTransactionsController < ApplicationController
  before_action :set_medication_transaction, only: %i[show edit update destroy]

  # GET /medication_transactions or /medication_transactions.json
  def index
    @medication_transactions = MedicationTransaction.all
  end

  # GET /medication_transactions/1 or /medication_transactions/1.json
  def show; end

  # GET /medication_transactions/new
  def new
    @medication_transaction = MedicationTransaction.new
  end

  # GET /medication_transactions/1/edit
  def edit; end

  # POST /medication_transactions or /medication_transactions.json
  def create
    @medication_transaction = MedicationTransaction.new(medication_transaction_params)

    respond_to do |format|
      if @medication_transaction.save
        format.html { redirect_to(medication_transaction_url(@medication_transaction), notice: 'Medication transaction was successfully created.') }
        format.json { render(:show, status: :created, location: @medication_transaction) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @medication_transaction.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /medication_transactions/1 or /medication_transactions/1.json
  def update
    respond_to do |format|
      if @medication_transaction.update(medication_transaction_params)
        format.html { redirect_to(medication_transaction_url(@medication_transaction), notice: 'Medication transaction was successfully updated.') }
        format.json { render(:show, status: :ok, location: @medication_transaction) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @medication_transaction.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /medication_transactions/1 or /medication_transactions/1.json
  def destroy
    @medication_transaction.destroy!

    respond_to do |format|
      format.html { redirect_to(medication_transactions_url, notice: 'Medication transaction was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_medication_transaction
    @medication_transaction = MedicationTransaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def medication_transaction_params
    params.require(:medication_transaction).permit(:medication_id, :member_id, :amount)
  end
end
