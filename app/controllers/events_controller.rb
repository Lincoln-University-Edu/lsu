class EventsController < ApplicationController
  before_action :set_event, only: %i[ update destroy ]

  def index
   events = Event.all
   json_response(events)
  end

  def create
    event = Event.create!(event_params)
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

  def event_params
    params.permit(
      :datetime,
      :entity_id,
      :name,
      :description,
      :location,
      :price,
      :external_link,
      :event_keywords,
      :category,
    )
  end
end
