# Engineering Task for GiveDirectly

## First Thoughts

Sinatra single file with endpoints.
Ruby standardlib datastore.
Librarian PORO.
Authenticator PORO - Aka, validate email for right now.

How will you handle books with the same title... aka: "Cats"


## Instructions

Instructions: Implement a service that exposes the endpoints described below. This service is for a library, and we are adding a new ​/request endpoint which allows a user to request a book by title. Endpoints should accept and return valid JSON.  You may use Python/Flask, Ruby/Sinatra, or other reasonably mainstream language or microframework, with a datastore of your choice (Dockerized DB, sqlite3, flatfiles, etc., are all fine).

Note: Please don’t spend much more than 3 hrs on this. If you hit the 3 hour mark and are not done, let us know in your documentation and write up what the remaining steps would have been. We are mainly looking to understand how you approach technical problems. 

Deliverable: public git repo with codebase. Please include basic installation instructions.

## Endpoints

### Add request endpoint 
This allows users to request a particular book. Ensure email is of a valid format and title exists in our list of titles in the database. Book titles in the library may be seeded and generated however you see fit.

Request

POST /request

- email (string): Requesting user's email address
- title (string): Desired book title

Response

- id (int): ID of the book
- available (boolean): return whether a specific book is available (a book is available if it has not been requested by anyone)
- title (string): Title of the book
- timestamp (string): ISO-8601 formatted date/time the book was requested

Retrieve request endpoint
Allows users to retrieve/see an existing request by using an id, or a list of all existing requests if id is omitted.

Request

GET /request/ -or- GET /request/<id>

Response

If id isn't set, return all existing requests. Otherwise, return the specified request data.

Delete request endpoint
Allows a user to remove an existing request, making that book available.

Request

DELETE /request/<id>

Response

Empty response body
