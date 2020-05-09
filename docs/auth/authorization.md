#### Authorization
Authorization is handled via the `application_controller` using the `AuthorizateApiRequest` singleton which can 
be found in `app/auth`

#### Usage
To use, simply create an instance of the singleton class, pass it the headers object 
and access the entry point via it's `.call` method to retrieve the valid `user` object hash, 
consisting of the `user` which corresponds to the decoded auth token(Json Web Token) in the request header.

#### Example
```ruby
variable_valid_user_object = AuthorizeApiRequest.new(request.header).call
# request.header = {'Authorization': auth_token_that_was_received_on_authentication}
# Output => {user: user_object, auth_token: some_encoded_token_you_can_use_in_subsequent_requests}
```
Note: The auth token is what you received on authentication. You can find a way to store it in your frontend app 
because it is required to authorize subsequent API requests. Ensure the `Authorization` header is always set or you 
will receive a `422` error