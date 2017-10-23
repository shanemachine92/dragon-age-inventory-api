### Dragon Age Themed Inventory API

Just a fun little command line based Rails API where you can build out inventories for your Dragon Age party members and store items. This API requires an auth token to access

#### Getting Started

1. To get chatting, first clone the repo: `git clone git@github.com:shanemachine92/dragon-age-inventory-api.git`

2. Use `cd` to navigate to the main directory, `dragon-age-inventory-api`

3. run the command `rail s` to start the server in your terminal.

#### Signing Up

To create a user using curl, pass along an email, password, and password confirmation.

ex: `curl -X POST -d email='<email>' -d password='<password>' -d password_confirmation='<password>' http://localhost:3000/signup`

### Get Auth Token

Once you've signed up a user, get your authorization token by passing your email address and password to the `auth_user` endpoint:

ex: `curl -X POST -d email='<email>' -d password='<password>' http://localhost:3000/auth_user`

The output should look something like this: `{"auth_token":"####################################.##################.###########################################","user":{"id":#,"email":"<email>"}}`

You should now be able to get, post, and update inventories and items by passing in the mandatory  fields.

Inventories: title, created_by
Items: name, description, wielder, level

Remmeber, you MUST pass in your authorization token along with each of your requests in order for them to be successful.

Some examples using curl:

##### GET requests
Get all inventories: `curl -H "Authorization: Bearer <token>" http://localhost:3000/inventories`

Get a particular inventory by ID: `curl -H "Authorization: Bearer <token>" http://localhost:3000/inventories/1`

Get an inventory's items:`curl -H "Authorization: Bearer <token>" http://localhost:3000/inventories/<id>/items`

Get a particular item:`curl -H "Authorization: Bearer <token>" http://localhost:3000/inventories/<id>/items/<id>`

##### POST requests
To create a new inventory:`curl -H "Authorization: Bearer <token>" -X POST -d title='Staffs' -d created_by='shane' http://localhost:3000/inventories`

To create a new item:`curl -H "Authorization: Bearer <token>" -X POST -d title='Staffs' -d created_by='shane' http://localhost:3000/inventories/<id>/items`

##### PUT requests

To update an inventory's title: `curl -H "Authorization: Bearer <token>" -X PUT -d title='Staffs on Staffs' http://localhost:3000/inventories/<id>`

You get the idea...

##### DELETE requests
`curl -H "Authorization: Bearer <token>" -X DELETE http://localhost:3000/inventories/<id>/items/<id>`






