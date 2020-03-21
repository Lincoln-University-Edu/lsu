class AcademicEventsController < ApplicationController
  before_action :set_academic_event, only: %i[ destroy update ]

  def index
    academic_events = AcademicEvent.all
    json_response(academic_events)
  end 

  def create
    academic_event = AcademicEvent.create!(academic_event_params)
    json_response(academic_event, :created)
  end

  def update
    @academic_event.update(academic_event_params)
    head :no_content
  end

  def destroy
    @academic_event.destroy
    head :no_content
  end

  private
  
  def set_academic_event
    @academic_event = AcademicEvent.find_by!(id: params[:id])
  end

  def academic_event_params
    params.permit(:start_time, :end_time, :name, :description, :location)
  end
end
