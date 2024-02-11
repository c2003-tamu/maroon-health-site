class MedicationsController < ApplicationController
  before_action :set_medication, only: %i[ show edit update destroy ]
  before_action :check_admin  
  def lowstock
    @medications = Medication.where("stock <= ?", 10)
  end

  # GET /medications or /medications.json
  def index
  
    @medications = if params[:search]
                     search_term = ActiveRecord::Base.sanitize_sql(params[:search].downcase)
                     similarity_expression = Arel.sql("similarity(name, '#{search_term}')")
                     Medication.where("name % ?", search_term).order(similarity_expression.desc)
                     #Medication.where("name % ?", params[:search].downcase).order(Arel.sql("similarity(name, '#{params[:search].downcase}') DESC"))
                   else
                     Medication.order(:name)
                   end

  
  end

  # GET /medications/1 or /medications/1.json
  def show
  end

  # GET /medications/new
  def new
    @medication = Medication.new
  end

  # GET /medications/1/edit
  def edit
  end

  # POST /medications or /medications.json
  def create
    @medication = Medication.new(medication_params)

    respond_to do |format|
      if @medication.save
        format.html { redirect_to medication_url(@medication), notice: "Medication was successfully created." }
        format.json { render :show, status: :created, location: @medication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @medication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medications/1 or /medications/1.json
  def update
    respond_to do |format|
      if @medication.update(medication_params)
        format.html { redirect_to medication_url(@medication), notice: "Medication was successfully updated." }
        format.json { render :show, status: :ok, location: @medication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @medication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medications/1 or /medications/1.json
  def destroy
    @medication.destroy

    respond_to do |format|
      format.html { redirect_to medications_url, notice: "Medication was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medication
      @medication = Medication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def medication_params
      params.require(:medication).permit(:name, :stock, :notes)
    end
    def check_admin
      unless current_member && current_member.admin?
        flash[:alert] = "You are not authorized to access this page."
        redirect_to root_path
      end
    end



end
