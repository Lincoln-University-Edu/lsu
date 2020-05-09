### Events
The events model is used in the creation of social/public events

#### Attributes
* id(PK)
* start_date(datetime)
* end_date(datetime)
* name(string)
* description(string)

#### Validations
The presence of the following are validated before the model is saved, hence you cannot create an event without them
* start_date(datetime)
* end_date(datetime)
* name(string)
* description(string)
