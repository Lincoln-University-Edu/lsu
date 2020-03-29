class EventsController < ApplicationController
  before_action :set_event, only: %i[ update destroy ]
  before_action :set_entity, only: %i[ create ]
  before_action :check_new_event_category, only: %i[ create ]
  before_action :check_existing_event_category, except: %i[ index create ]

  def index
   events = Event.all
   json_response(events)
  end

  def create
    event = @entity.events.create!(event_params)
    json_response(event, :created)
  end

  def update
    @event.update(event_params)
    head :no_content
  end

  def destroy
    @event.destroy
    head :no_content
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def set_entity
    @entity = Entity.find(params[:entity_id])
  end

  def event_params
    params.permit( :start_time, :end_time, :name, :description, :location, :price, :external_link, :event_keywords, :entity_id, :event_category)
  end

  def check_existing_event_category
    if @event.event_category == 'Student Life'
      raise(ExceptionHandler::AuthenticationError, "You are not a Student Life Event Publisher") unless current_user.is_student_life_event_publisher
    end

    if @event.event_category == 'Athletic'
      raise(ExceptionHandler::AuthenticationError, "You are not an Athletic Event Publisher") unless current_user.is_athletic_event_publisher
    end
  end

  def check_new_event_category
    if params[:event_category] == 'Student Life'
      raise(ExceptionHandler::AuthenticationError, "You are not a Student Life Event Publisher") unless current_user.is_student_life_event_publisher
    end

    if params[:event_category] == 'Athletic'
      raise(ExceptionHandler::AuthenticationError, "You are not an Athletic Event Publisher") unless current_user.is_athletic_event_publisher
    end
  end
end
