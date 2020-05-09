
# The following endpoints are available for the entities resource
- GET `/entities`
**Returns a list of all entities with just the name and id attributes present**

- POST `/entities`
**Creates an entity with valid params**

- GET `/full_entities?org_type=organization_type_here`
**Returns entities that correspond with the organization type, with all attributes present**

- SHOW `/entities/:id`
**Returns an entity with valid id**

- PUT `/entities/:id`
**Updates an entity with valid params**

- DELETE `/entities/:id`
**Deletes an entity**

- DELETE `/entities/:id`
**Deletes an entity**

- POST `/entities/:id/add_user_to_entity/:user_id`
**Adds an entity to the list of a users entities valid params**

- DELETE `/entities/:id/remove_user_from_entity/:user_id`
**Removes an entity from the list of a users entities valid params**

#### Note: All endpoints require an authorization header as specified in the [Authorization Docs](../auth/authorization.md)