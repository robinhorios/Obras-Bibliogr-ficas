## Steps to install this project

* Clone the project:

`git clone git@github.com:robinhorios/Obras-Bibliogr-ficas.git`

* Install gems:

`bundle install`

* Create databese:

`rails db:migrate`

* Run the migrations

`rails db:migrate`

* Run the server

`rails s`

## API Documentation

### POST /authors

A list of author names are created.

**Content Type** `application/json`

Sample:

```json
{ 
    "author": {
        "names": [
            "Celso de Araujo",
            "João Silva Neto"
        ]
  }
}
```

Responses:

* **201 created**** When the author names is created correctly
* **500 Internal Server Error** When there is a failure in the request format or the
  payload can't be unmarshaled.

