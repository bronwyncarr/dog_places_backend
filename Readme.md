## Installing the App

### Dependencies

- ruby 2.7.2
- yarn 1.22.10
- node v14.15.1

### Actual install

- Clone both repositories [Front end](https://github.com/bronwyncarr/dog_places_frontend) and [Back end](https://github.com/bronwyncarr/dog_places_backend)
- Run `yarn install` for the front end and `bundle install` for rails then on rails run a `rails db:create` and `rails db:seed`
  From here the app will not work unless you delete the credentials and run `EDITOR='code --wait' rails credentials:edit`
  which will give you a new master key and make knock work.
  this app also uses a google maps api key a sendgrid api key which you will need in the rails credentials for the appto function correctly locally

## How to test

Since the React side of this app takes information from the rails app you will need to run this command to seed the test database `RAILS_ENV=test rake db:test:prepare db:seed` which will seed the test data base and allow you to test both the backend with the pre configured RSpec tests which can be run with `bin/rspec -fd` the -fd here is optional and just gives you more information while the tests run
and the front end can be tested with Cypress by running `yarn run e2e` whilst the rails app is running with this command `rails s -e test`
then just select which test you want to check and see that they all pass and the app is ready to go.
