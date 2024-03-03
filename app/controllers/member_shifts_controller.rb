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
      case @member_shift.volunteer_category
      when 'M1-M2'
        @event.decrement_m1_m2
      when 'M3-M4'
        @event.decrement_m3_m4
      end
      @event.decrement_ideal_volunteers
      redirect_to(signup_url, notice: 'You have successfully signed up for this event.')
    else
      render(:new)
    end
  end

  def destroy
    @member_shift = MemberShift.find(params[:id])
    @event = @member_shift.event
    @member_shift.destroy!

    case @member_shift.volunteer_category
    when 'M1-M2'
      @event.increment_m1_m2
    when 'M3-M4'
      @event.increment_m3_m4
    end
    @event.increment_ideal_volunteers

    redirect_to(signup_url, notice: 'Successfully unregistered from this event.')
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def member_shift_params
    params.require(:member_shift).permit(:member_id, :volunteer_category)
  end
end
