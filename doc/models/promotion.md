### Promotion
The promotion model is used in the creation of social/public promotion

#### Attributes
* id(PK)
* contact(string)
* title(string)
* body(string)
* cover_image(string url)
* external_link(string url)
* student_wire_keywords(string)

#### Validations
The presence of the following are validated before the model is saved, hence you cannot create an user without them
* contact(string)
* title(string)
* body(string)
* cover_image(string url)
* external_link(string url)
* student_wire_keywords(string)

##### Validated at the database level
The following attributes are validated as a result of the belongs_to association on this model. 
* user_id

* What does this mean? 
A user must create an promotion like so: 
```ruby
user = User.create!(user_params)
promotion = user.promotions.create!(promotion_params)
```
or

Using the current_user object
```ruby
promotion = current_user.promotions.create!(promotion_params)
```


Alternatively, you may create the promition then add the user id to it like so: 
```ruby
user = User.create!(user_params)
promotion = Promotion.new(promotion_params)
# take note of the two variations below
promotion.user = user or promition.user_id = user.id
promotion.save!
```