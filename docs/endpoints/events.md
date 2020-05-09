
# The following endpoints are available for the events resource
- GET `/events`
**Returns a list of all events**

- GET `/events`
**Returns a list of all events**

- GET `/upcoming events`
**Returns all upcoming events i.e events for the current and future days**

- GET `/past_events`
**Returns all past events i.e events before the current day**

- POST `/events`
**Creates an event with valid params**

- GET `/events/:id`
**Returns an event with valid id**

- PUT `/events/:id`
**Updates an event with valid params**

- DELETE `/events/:id`
**Deletes an event**

- DELETE `/events/:id`
**Deletes an event**

#### Note: All endpoints require an authorization header as specified in the [Authorization Docs](../auth/authorization.md)