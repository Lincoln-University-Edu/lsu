### Entity
The entity model is used in the creation of social/public entity

#### Attributes
* id(PK)
* name(string)
* description(string)
* email(string)
* phone number(int)
* location(string)
* isOffice(boolean)
* isOrganisation(boolean)

#### Validations
The presence of the following are validated before the model is saved, hence you cannot create an event without them
* name(string)
* description(string)
* email(string)
* phone number(int)
* location(string)