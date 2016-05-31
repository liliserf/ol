# OL API

## Installation 
Uses Ruby 2.3.1, Rails 4.2.6, Postgresql 9.5.3 as database and kaminari gem for pagination.
 1. Install Postgres via homebrew `brew install postgres`
 2. git clone project `git clone git@github.com:liliserf/ol.git`
 3. cd into project `cd ol`
 4. run `bundle install`

## Setup
 1. Run `rake db:setup`
 2. Start the rails server with `rails s` from the terminal

## Importing
- To import the original CSV file provided, run in the command line: 
```
rake import:businesses["engineering_project_businesses.csv"]
```
- To import the original file directly from the gzip link, run:
```
rake import:businesses["https://s3.amazonaws.com/ownlocal-engineering/engineering_project_businesses.csv.gz"]
```
- To import a new CSV file, save the file to the root folder and use the file name as the rake task argument:
```
rake import:businesses["new_file.csv"]
```
- To import a new gzip url, use the url as the rake task argument: 
```
rake import:businesses["new_gzip.csv.gz"]
```
 
 *Duplicate records will not be added to the database.*

## Endpoints

### SHOW
Name | Method | Description
--- | --- | ---
/api/businesses/{id} | GET | Lookup business information by id.

#### Sample request:
```shell
# Browser
http://localhost:3000/api/businesses/1

# Command Line
curl -H "Accept: application/json" "http://localhost:3000/api/businesses/1"
```

#### Sample response:
```
{
  "id": 1,
  "uuid": "d083169c-4340-4a07-b390-07d297823efd",
  "name": "Botsford Ltd",
  "address": "74883 Hane Prairie",
  "address2": null,
  "city": "Margrettburgh",
  "state": "KS",
  "zip": "99840",
  "country": "US",
  "phone": "2462288476",
  "website": "http://bergstrom.org/",
  "created_at": "2013-11-19T23:26:13.000Z"
}
```
*If the id does not exist in the database, the response will include an error message and `404` code.*

### INDEX

Name | Method | Parameter | Description
--- | --- | --- | ---
/api/businesses?page=  | GET | page | Request batches of business records with pagination.

- Requests return JSON with 50 business records per page as well as pagination meta data including `per_page`, `total_businesses`, `total_pages` and `current_page`.

*Without a page param, request defaults to page 1.*

#### Sample request:
```shell
# Browser
http://localhost:3000/api/businesses?page=2

# Command Line
curl -H "Accept: application/json" "http://localhost:3000/api/businesses?page=2"
```

#### Sample response:
```
{
  "businesses": [
    {
      "id": 50,
      "uuid": "f1dfb6a3-ecfb-404b-8d5b-f93266c8242b",
      "name": "Hilll Group",
      "address": "777 Julianne Street Apt. 893",
      "address2": "Apt. 136",
      "city": "Bechtelarview",
      "state": "FL",
      "zip": "96980",
      "country": "US",
      "phone": "5932720216",
      "website": "http://www.carroll.com/",
      "created_at": "2016-03-05T08:45:00.000Z"
    }, ...],
  "meta": {
    "pagination": {
      "per_page": 50,
      "total_pages": 1000,
      "total_businesses": 50000,
      "current_page": 2
    }
  }
}
```
*If the page parameter exceeds the total number of pages, the response will include an error message and `404` code.*

### Testing
The tests are written using RSpec. To run the test suite, call `bundle exec rspec` from the command line.

