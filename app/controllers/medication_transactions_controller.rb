# frozen_string_literal: true

class MedicationTransactionsController < ApplicationController
  before_action :set_medication_transaction, only: %i[show edit update destroy]
  # before_action :check_admin

  # GET /medication_transactions or /medication_transactions.json
  def index
    @medication_transactions = MedicationTransaction.all.order(created_at: :asc)
  end

  # GET /medication_transactions/1 or /medication_transactions/1.json
  def show; end

  # GET /medication_transactions/new
  def new
    if params[:id].present?
      @medication = Medication.find(params[:id])
      @medication_transaction = MedicationTransaction.new(medication_id: @medication.id)
    else
      redirect_to(root_path, alert: 'Medication ID is required.')
    end
  end

  # GET /medication_transactions/1/edit
  def edit
    @medication_transaction = MedicationTransaction.find(params[:id])
    @medication = Medication.find(@medication_transaction.medication_id)
  end

  # POST /medication_transactions or /medication_transactions.json
  def create
    @medication_transaction = MedicationTransaction.new(medication_transaction_params)
    @medication_transaction.member_id = current_member.id

    handle_medication_absence_and_amount_validation
    return if performed?

    handle_insufficient_stock
    return if performed?

    respond_to do |format|
      if @medication_transaction.save
        update_medication_stock(@medication_transaction, :decrease)

        format.html { redirect_to(medication_transactions_path, notice: 'Medication transaction was successfully created.') }
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

        format.html { redirect_to(medication_transactions_path, notice: 'Medication transaction was successfully updated.') }
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
      format.html { redirect_to(medication_transactions_url, notice: 'Medication transaction was successfully deleted.') }
      format.json { head(:no_content) }
    end
  end

  private

  def handle_medication_absence_and_amount_validation
    if @medication_transaction.medication.nil?
      redirect_to(medications_path, alert: 'Medication not found.')
    elsif @medication_transaction.amount.blank? || @medication_transaction.amount.zero?
      redirect_to(medications_path, alert: 'Transaction amount cannot be blank or zero.')
    end
  end

  def handle_insufficient_stock
    medication = @medication_transaction.medication
    if @medication_transaction.amount.negative? && (medication.stock + @medication_transaction.amount).negative?
      redirect_to(medications_path, alert: 'Insufficient stock.')
    end
  end

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
      if amount.negative?
        medication.update!(stock: medication.stock + amount.abs)
      else
        medication.update!(stock: medication.stock - amount)
      end
    when :update
      original_amount = transaction.amount_before_last_save
      difference = amount - original_amount

      if difference.negative?
        medication.update!(stock: medication.stock - difference.abs)
      else
        medication.update!(stock: medication.stock + difference)
      end
    when :decrease
      if amount.negative?
        medication.update!(stock: medication.stock - amount.abs)
      else
        medication.update!(stock: medication.stock + amount)
      end
    end
  end

  def check_admin
    unless current_member && (current_member.admin? || current_member.volunteer?)
      flash[:alert] = 'You are not authorized to access that page.'
      redirect_to(root_path)
    end
  end
end
