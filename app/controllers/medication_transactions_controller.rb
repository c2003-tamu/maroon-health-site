# frozen_string_literal: true

class MedicationTransactionsController < ApplicationController
  before_action :set_medication_transaction, only: %i[show edit update destroy]
  # before_action :check_admin

  # GET /medication_transactions or /medication_transactions.json
  def index
    @medication_transactions = MedicationTransaction.all
  end

  # GET /medication_transactions/1 or /medication_transactions/1.json
  def show; end

  # GET /medication_transactions/new
  def new
    if params[:id].present?
      @medication_transaction = MedicationTransaction.new(id: params[:id])
      @medication_transaction.medication_id = params[:id]
    else
      @medication_transaction = MedicationTransaction.new
    end
  end

  # GET /medication_transactions/1/edit
  def edit; end

  # POST /medication_transactions or /medication_transactions.json
  def create
    @medication_transaction = MedicationTransaction.new(medication_transaction_params)
    @medication_transaction.member_id = current_member.id

    respond_to do |format|
      if @medication_transaction.save
        update_medication_stock(@medication_transaction, :decrease)

        format.html { redirect_to(medications_path, notice: 'Medication transaction was successfully created.') }
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
        @medication_transaction.member_id = current_member.id
        update_medication_stock(@medication_transaction, :update)

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
    @medication_transaction.member_id = current_member.id
    update_medication_stock(@medication_transaction, :increase)
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
    params.require(:medication_transaction).permit(:medication_id, :amount)
  end

  def update_medication_stock(transaction, type)
    medication = transaction.medication
    amount = transaction.amount

    case type
    when :increase
      medication.update!(stock: medication.stock + amount)
    when :update
      original_amount = transaction.amount_before_last_save
      difference = amount - original_amount

      if transaction.saved_change_to_medication_id?
        original_medication_id, updated_medication_id = transaction.saved_changes[:medication_id]
        original_medication = Medication.find_by(id: original_medication_id)
        updated_medication = Medication.find_by(id: updated_medication_id)

        original_medication.update!(stock: original_medication.stock + transaction.amount_before_last_save)

        updated_medication&.update!(stock: updated_medication.stock - transaction.amount_before_last_save)
      else
        medication.update!(stock: medication.stock - difference)
      end
    when :decrease
      medication.update!(stock: medication.stock - amount)
    end
  end

  def check_admin
    unless current_member && (current_member.admin? || current_member.volunteer?)
      flash[:alert] = 'You are not authorized to access this page.'
      redirect_to(root_path)
    end
  end
end
