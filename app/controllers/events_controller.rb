class EventsController < ApplicationController
  before_action :set_event, only: %i[ update destroy ]
  before_action :set_entity, only: %i[ create ]

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
    params.permit( :start_time, :end_time, :name, :description, :location, :price, :external_link, :event_keywords, :entity_id,:category)
  end
end
