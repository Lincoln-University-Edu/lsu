### Student Wire
The `studentwire` model is used in the creation of student news

#### Attributes
* id(PK)
* contact(string)
* title(string)
* body(string)
* cover_image(string url)
* external_link(string url)
* student_wire_keywords(string)

#### Validations
The presence of the following are validated before the model is saved, hence you cannot create an event without them
* contact(string)
* title(string)
* body(string)
* cover_image(string url)
* external_link(string url)
* student_wire_keywords(string)