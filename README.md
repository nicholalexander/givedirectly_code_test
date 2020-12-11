# Engineering Task for GiveDirectly

## Discussion 

The app is set up as a sinatra app with three main classes.  A `Librarian` who knows how to work with `Book`s and with the `Datastore`.  The Librarian has the datastore (which I probably should've called Shelves!) injected so that as long as the datastore responds to the messages that the Librarian sends it, it will be easy to swap out with a postgres db or a redis store or whatever it is that you want to gussy this up with.

The nice thing about this separation is that it is my hope that it keeps things very limited.  The library_api, the main file, should only worry about dealing with web requests and sending the librarian messages, the librarian shouldn't care about the data store, and the the librarian and the underlying functionality of the books should also be separated.

One thing that was unclear from the instructions is what the successful result of a POST request did.  I had it indicate that the book was available which would be the signal to the client that their request was successful.  That way, if they make a post request, instead of denying it or raising an error, it will return the same data but with the available flag set to `false`.

Right now, after every case of modifying the books, the datastore deserializes all the books and writes them to a yaml file.  This is obviously not very effecient, though with a different datastore one could improve this and it should be a fairly straight forward proceedure.

I did not implement the DELETE route due to time constraints.  The procedure would involve marking the available flag as true, erasing the time stamp, and writing the books to the disk.  There are also so non-happy paths that I didn't handle: requesting a book that doesn't exist, and also making poorly formed requests.

## Installation & Running

1. clone the repo
2. bundle install
3. `rake start` will start the sinatra app on (http://localhost:4567)

## Testing

`rake`

The app uses minitest to run unit tests and to test the sinatra side of things, though the sinatra tests are in poor shape after a refactoring because I need to make it such that the datastore is injected into the sinatra app which requires moving from the basic Sinatra setup to the Modular one.

## TODO

- [ ] Implement returning books.
- [ ] Error handling & edge cases.
- [ ] Make the sinatra app a regular modular style so that we can more easily inject a datastore for testing.
- [ ] Clarify rules for handling books of the same title
- [ ] Discuss how to handle multiple copies of the same book, if at all.
