# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :set_member, only: %i[show edit update destroy]
  # before_action :check_admin

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
        format.html { redirect_to(member_url(@member), notice: 'Member was successfully updated.') }
        format.json { render(:show, status: :ok, location: @member) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @member.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @member.destroy!

    respond_to do |format|
      format.html { redirect_to(members_url, notice: 'Member was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  def mass_email_form; end

  def send_mass_email
    respond_to do |format|
      if mass_email(email_params)
        format.html { redirect_to(members_url, notice: 'Mass email successfully sent.') }
        format.json { head(:no_content) }
      else
        format.html { render(:mass_email_form, status: :unprocessable_entity) }
        format.json { render(json: errors, status: :unprocessable_entity) }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find(params[:id])
  end
  
  def mass_email(email_params, event_id = nil)
    email_subject = email_params[:subject]
    email_content = email_params[:contents]
    my_email = current_member.email
    event_id ||= params[:event_id]
    if !event_id.nil?
      @members = Member.joins(:member_shifts).where(member_shifts: { event_id: event_id }).distinct
      @members.each do |member|
        email_member(member.email, my_email, email_subject, email_content)
      end
    else
      @members = Member.where(role: 'volunteer')
      @members.each do |member|
        email_member(member.email, my_email, email_subject, email_content)
        puts ('wrong')
      end
    end
  end

  # def mass_email(email_params)
  #   email_subject = email_params[:subject]
  #   email_content = email_params[:contents]
  #   my_email = current_member.email
  #   #@members = Member.where(role: 'volunteer')
  #   @members = Member.where(role: 'volunteer')
  #   @members.each do |member|
  #     email_member(member.email, my_email, email_subject, email_content)
  #   end
  # end

  def email_member(to_email, from_email, email_subject, email_content)
    require 'sendgrid-ruby'

    from = SendGrid::Email.new(email: from_email)
    to = SendGrid::Email.new(email: to_email)
    subject = email_subject
    content = SendGrid::Content.new(type: 'text/plain', value: email_content)
    mail = SendGrid::Mail.new(from, subject, to, content)

    #take this out before final deployment
    sg = SendGrid::API.new(api_key: 'SG.5aenmBEsQrejCARv-UQQAw.RQjwC7w7Swn3EPE5C4pAqzMkEQ73AzOuvR1q0C2_cas')
    response = sg.client.mail._('send').post(request_body: mail.to_json)

    puts response.status_code
    puts response.body
    puts response.headers
  end

  # only allow trusted email parameters through
  def email_params
    params.require(:email).permit(:subject, :contents)
  end

  # Only allow a list of trusted parameters through.
  def member_params
    params.require(:member).permit(:role, :full_name).tap do |allowlisted|
      allowlisted[:role] = params[:member][:role] if %w[admin volunteer].include?(params[:member][:role])
    end
  end

  def check_admin
    unless current_member&.admin?
      flash[:alert] = 'You are not authorized to access this page.'
      redirect_to(root_path)
    end
  end
end
