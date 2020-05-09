### Endpoints
RESTFUL ENDPOINTS are available for the following resources, giving access to CRUD functionality for each one:

[Authentication](authentication.md)
[Users](users.md)
[Events](events.md)
[AcademicEvents](academic_events.md)
[Articles](articles.md)
[Entities](entities.md)
[Majors](majors.md)
[Promotions](promotions.md)
[StudentWires](student_wires.md)

### Pagination
Index requests on all resources are paginated to return 15 objects per page

#### Example
* Request
```javascript
axios.get('api-url/events', headers: {'Authorization': 'auth_token'})
```
* Result
```JSON
  {
      "events": [...],
      "meta": {
          "pagination": {
              "per_page": 15,
              "total_pages": 2,
              "total_objects": 20,
              "links": {
                  "first": "/events?page=1",
                  "last": "/events?page=2",
                  "next": "/events?page=2"
              }
          }
      }
  }
```
* Parameters
All index actions take the `page` parameter which defaults to `1` if not provided and raises an error if the page isn't valid