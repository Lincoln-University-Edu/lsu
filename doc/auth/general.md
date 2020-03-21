#### Auth
The authentications and authorizations are all handled by `JWT` you can find out how it works by heading over 
to the `Json Web Token` singleton in `app/auth`. 

#### Usage
The Json Web Token class provides you with 2 methods:
* Encode: This encodes the payload(user_id) when you authenticate a user(login)
* Decode: This decodes the authentication token which is the `user_id`

#### Extras
To find out some more, checkout:
[Authentication](authentication.md)
[Authorization](authorization.md)