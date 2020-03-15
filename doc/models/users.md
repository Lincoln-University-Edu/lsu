### Events
The events model is used in the creation of social/public events

#### Attributes


#### Validations
The presence of the following are validated before the model is saved, hence you cannot create an event without them
* datetime(datetime)
* name(string)
* description(string)
* location(string)
* price(int)
* external link(string)
* keywords(array)
* category(string)

##### Validated at the database level
The following attributes are validated as a result of the belongs_to association on this model. 
* entity_id

** Ex: 
An entity must create an event like so: 
entity = Entity.create!(entity_params)
event = entity.events.create!(event_params)

Alternatively, you may create the event then add the entity id to it like so: 
entity = Entity.create!(entity_params)
event = Event.new(event_params)
event.entity = entity or event.entity_id = entity.id
event.save!