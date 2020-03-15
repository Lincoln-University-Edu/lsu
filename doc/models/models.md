# Available Models
* [Events](events.md)

### Creating a new model     
To create a new model (add a new table to the database), follow the example below

#### Example
Say you want to add a new model/table to the database called `some_model`, follow this procedure:

* Enter the project's root directory
`cd` into the project's directory

* Generate the model
```ruby
rails g model SomeModel some_string_attribute some_integer_attibute:integer some_boolean_attribute:boolean
```
* Run Migrations
Run the Migrations via your terminal
```ruby
rails run db:migrate
```

### Adding attributes to models
To add an attribute to a model, you should generate a migration, specify the table name, attribute name(column name) you want to add, 
along with any constraints or default values you want.

#### Example
Say you want to add a new attribute to users called marital_status, follow this procedure:

* Enter the project's root directory
`cd` into the project's directory

* Generate the migration
rails g migration AddMaritalStatusToUsers

* Write the migration
In your text editor go to app/db/migrate/random_numbers_add_marital_status_to_users, and add the following:
```ruby 
add_column :users, :marital_status, default: "", null: false
```

Note: default values and null constraints are optional


