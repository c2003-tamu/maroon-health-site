# frozen_string_literal: true

class MemberShiftsController < ApplicationController
  before_action :set_event, only: %i[new create]

  def index
    @member_shifts = MemberShift.all
  end

  def show
    @member_shift = MemberShift.find(params[:id])
  end

  def new
    @member_shift = MemberShift.new
  end

  def create
    @member_shift = MemberShift.new(member_shift_params)
    @member_shift.event = @event
    if @member_shift.save
      @event.decrement_ideal_volunteers
      members_controller = MembersController.new
      members_controller.send(:email_member, current_member.email, 'seansayce@tamu.edu', 'Event Signup', 'You have been successfully signed up for the event.')
      redirect_to(signup_url, notice: 'You have successfully signed up for this event.')
    else
      render(:new)
    end
  end

  def destroy
    @member_shift = MemberShift.find(params[:id])
    @event = @member_shift.event
    @member_shift.destroy!

    @event.increment_ideal_volunteers

    redirect_to(signup_url, notice: 'Successfully unregistered from this event.')
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def member_shift_params
    params.require(:member_shift).permit(:member_id)
  end
end
