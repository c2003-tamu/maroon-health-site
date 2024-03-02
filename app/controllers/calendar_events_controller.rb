# frozen_string_literal: true

class CalendarEventsController < ApplicationController
  before_action :set_calendar_event, only: %i[show display edit update destroy]
  before_action :check_admin, except: [:display]

  # GET /calendar_events or /calendar_events.json
  def index
    @calendar_events = CalendarEvent.all.order(:start_datetime)
  end

  # GET /calendar_events/1 or /calendar_events/1.json
  # show is for the admin to see - it has links to edit and delete
  def show; end

  # display is different than show - it is for the public to see
  def display; end

  # GET /calendar_events/new
  def new
    @calendar_event = CalendarEvent.new
  end

  # GET /calendar_events/1/edit
  def edit; end

  # POST /calendar_events or /calendar_events.json
  def create
    @calendar_event = CalendarEvent.new(calendar_event_params)

    respond_to do |format|
      if @calendar_event.save
        format.html { redirect_to(calendar_event_url(@calendar_event), notice: 'Calendar event was successfully created.') }
        format.json { render(:show, status: :created, location: @calendar_event) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @calendar_event.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /calendar_events/1 or /calendar_events/1.json
  def update
    respond_to do |format|
      if @calendar_event.update(calendar_event_params)
        format.html { redirect_to(calendar_event_url(@calendar_event), notice: 'Calendar event was successfully updated.') }
        format.json { render(:show, status: :ok, location: @calendar_event) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @calendar_event.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /calendar_events/1 or /calendar_events/1.json
  def destroy
    @calendar_event.destroy!

    respond_to do |format|
      format.html { redirect_to(calendar_events_url, notice: 'Calendar event was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_calendar_event
    @calendar_event = CalendarEvent.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def calendar_event_params
    params.require(:calendar_event).permit(:title, :description, :start_datetime, :end_datetime)
  end

  def check_admin
    unless current_member&.admin?
      flash[:alert] = 'You are not authorized to access that page.'
      redirect_to(root_path)
    end
  end
end
