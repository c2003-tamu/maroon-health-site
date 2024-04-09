# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :set_member, only: %i[show edit update destroy]
  before_action :check_admin

  # GET /members or /members.json
  def index
    @members = Member.all
  end

  # GET /members/1 or /members/1.json
  def show; end

  # GET /members/new
  # def new
  #   @member = Member.new
  # end

  # GET /members/1/edit
  def edit; end

  # POST /members or /members.json
  # def create
  #   @member = Member.new(member_params)

  #   respond_to do |format|
  #     if @member.save
  #       format.html { redirect_to(member_url(@member), notice: 'Member was successfully created.') }
  #       format.json { render(:show, status: :created, location: @member) }
  #     else
  #       format.html { render(:new, status: :unprocessable_entity) }
  #       format.json { render(json: @member.errors, status: :unprocessable_entity) }
  #     end
  #   end
  # end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to(members_url, notice: 'Member was successfully updated.') }
        format.json { render(:show, status: :ok, location: @member) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @member.errors, status: :unprocessable_entity) }
      end
    end
  end

  def update_class_year
    @member = current_member
    if @member.update(member_params)
      redirect_back(fallback_location: signup_path, notice: 'Class year updated successfully.')
    else
      flash[:alert] = 'Failed to update class year.'
      redirect_back(fallback_location: root_path)
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @member.destroy!

    respond_to do |format|
      format.html { redirect_to(members_url, notice: 'Member was successfully deleted.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def member_params
    params.require(:member).permit(:role, :full_name, :class_year)
  end

  def check_admin
    unless current_member&.admin? || params[:action] == 'update_class_year'
      flash[:alert] = 'You are not authorized to access that page.'
      redirect_to(root_path)
    end
  end
end
