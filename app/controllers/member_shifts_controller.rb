class MemberShiftsController < ApplicationController
  before_action :set_member_shift, only: %i[ show edit update destroy ]

  # GET /member_shifts or /member_shifts.json
  def index
    @member_shifts = MemberShift.all
  end

  # GET /member_shifts/1 or /member_shifts/1.json
  def show
  end

  # GET /member_shifts/new
  def new
    @member_shift = MemberShift.new
  end

  # GET /member_shifts/1/edit
  def edit
  end

  # POST /member_shifts or /member_shifts.json
  def create
    @member_shift = MemberShift.new(member_shift_params)

    respond_to do |format|
      if @member_shift.save
        format.html { redirect_to member_shift_url(@member_shift), notice: "Member shift was successfully created." }
        format.json { render :show, status: :created, location: @member_shift }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member_shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_shifts/1 or /member_shifts/1.json
  def update
    respond_to do |format|
      if @member_shift.update(member_shift_params)
        format.html { redirect_to member_shift_url(@member_shift), notice: "Member shift was successfully updated." }
        format.json { render :show, status: :ok, location: @member_shift }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member_shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_shifts/1 or /member_shifts/1.json
  def destroy
    @member_shift.destroy

    respond_to do |format|
      format.html { redirect_to member_shifts_url, notice: "Member shift was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_shift
      @member_shift = MemberShift.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_shift_params
      params.require(:member_shift).permit(:title, :ideal_volunteers, :ideal_officers, :start_time, :end_time)
    end
end
