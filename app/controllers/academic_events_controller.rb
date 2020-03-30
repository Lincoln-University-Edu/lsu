class AcademicEventsController < ApplicationController
  before_action :set_academic_event, only: %i[ show destroy update ]
  before_action :check_user_role, except: %i[ index ]

  def index
    paginate AcademicEvent.all, per_page: 15
  end 

  def create
    academic_event = AcademicEvent.create!(academic_event_params)
    json_response(academic_event, :created)
  end

  def update
    @academic_event.update(academic_event_params)
    head :no_content
  end

  def show
    json_response(@academic_event)
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

  def check_user_role
    raise(ExceptionHandler::AuthenticationError, "You are not an Academic Event Publisher") unless current_user.is_academic_event_publisher
  end
end
