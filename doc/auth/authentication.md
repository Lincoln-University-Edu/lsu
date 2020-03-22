#### Authentication
Authentication is handled via the `authentication_controller` using the  `AuthenticateUser` singleton which can 
be found in `app/auth`

#### Endpoint
`/auth/login`

#### Accepted parameters
* `email`
* `password`

#### Usage
To use, simply create an instance of the singleton class, pass it the `email` and `password` parameters 
and access the entry point via it's `.call` method to retrieve the `authentication credentials` hash, 
consisting of the `auth token`(Json Web Token) and the `user` object

#### Example
```ruby
variable_for_credentials_containing_auth_token_and_user_object = AuthenticateUser.new(email_variable, password_variable).call
# Output => {user: user_object, auth_token: some_encoded_token_you_can_use_in_subsequent_requests}
```
#### Code Example
