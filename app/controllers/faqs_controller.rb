# frozen_string_literal: true

class FaqsController < ApplicationController
  before_action :set_faq, only: %i[show edit update destroy]
  before_action :check_admin

  # GET /faqs or /faqs.json
  def index
    @faqs = Faq.all
  end

  # GET /faqs/1 or /faqs/1.json
  def show; end

  # GET /faqs/new
  def new
    @faq = Faq.new
  end

  # GET /faqs/1/edit
  def edit; end

  # POST /faqs or /faqs.json
  def create
    @faq = Faq.new(faq_params)

    respond_to do |format|
      if @faq.save
        format.html { redirect_to(faqs_path, notice: 'FAQ was successfully created.') }
        format.json { render(:show, status: :created, location: @faq) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @faq.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /faqs/1 or /faqs/1.json
  def update
    respond_to do |format|
      if @faq.update(faq_params)
        format.html { redirect_to(faqs_path, notice: 'FAQ was successfully updated.') }
        format.json { render(:show, status: :ok, location: @faq) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @faq.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /faqs/1 or /faqs/1.json
  def destroy
    @faq.destroy!

    respond_to do |format|
      format.html { redirect_to(faqs_url, notice: 'FAQ was successfully deleted.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_faq
    @faq = Faq.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def faq_params
    params.require(:faq).permit(:question, :answer)
  end

  def check_admin
    unless current_member&.admin?
      flash[:alert] = 'You are not authorized to access that page.'
      redirect_to(root_path)
    end
  end
end
