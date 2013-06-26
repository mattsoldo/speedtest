This app is a plain-vanilla rails app designed to act as performance test for various platforms.

### Performance Endpoints

There are three endpoints for testing performance:

1. `/hello` the simplest performance endpoint. This action sets a variable and renders a simple HTML template.
2. `/show_random` retrieves a single record from the database, and renders an HTML page containing data from that record.
3. `/` performs a weighted random CRUD task. 40%: shows a single record retrieved from the database. 40%: a list of 10 records. 8%: create a new record. 2%: destroy a record.

### Running on Heroku

This apps only requirement is a postgres database. For ideal performance it should be run with the [nginx buildpack](https://github.com/ryandotsmith/nginx-buildpack). 

 