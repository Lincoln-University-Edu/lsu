### Users
The `user` model is used in the creation of a user when signing up

#### Attributes

#### Available Attributes
* last_name(string)
* first_name(string)
* email(int)
* student_class(string)
* all_majors(array)
* organizations(array)
* entities(array)
* is_lincolian_press_publisher
* is_student_wire_editor
* is_student_life_event_publisher
* is_academic_event_publisher
* is_athletic_event_publisher

##### Validations
The presence of the following are validated before the model is saved, hence you cannot create an event without them
* last_name(string)
* first_name(string)
* password(string)
* email(int)
