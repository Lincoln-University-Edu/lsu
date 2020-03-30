
# The following endpoints are available for the users resource
- GET `/users`
**Returns a list of all users**

- POST `/users`
**Creates a user with valid params**

- GET `/users/:id`
**Returns a user with valid id**

- PUT `/users/:id`
**Updates a user with valid params**

- DELETE `/users/:id`
**Deletes a user**

#### Note: All endpoints except POST `users` require an authorization header as specified in the [Authorization Docs](../auth/authorization.md)