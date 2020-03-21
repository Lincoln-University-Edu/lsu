
# The following endpoints are available for the entities resource
- GET `/entities`
*Returns a list of all entities

- POST `/entities`
*Creates an entity with valid params

- PUT `/entities/:id`
*Updates an entity with valid params

- DELETE `/entities/:id`
*Deletes an entity

- DELETE `/entities/:id`
*Deletes an entity

- POST `/entities/:id/users/new`
*Adds an entity to the list of a users entities valid params

- POST `/entities/:id/users/:user_id`
*Removes an entity from the list of a users entities valid params

#### Note: All endpoints require an authorization header as specified in the [Authorization Docs](../auth/authorization.md)