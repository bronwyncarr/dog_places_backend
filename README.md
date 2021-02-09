# T3A2 Off The Leash

## Task delegation
At the beginning of this project we discussed as a team what we felt were our strengths and weaknesses and planned our days accordingly. Rodney took the Backend development and testing to improve his knowledge of database structures and testing practices. Bronwyn took the frontend development because she felt more confident with the React frame work and Javascript overall as well as CSS. Throughout the project we had to juggle personal commitments as well as the project itself which lead to us having standup's each morning after class finished over the phone to discuss the days work and a plan of attack to accomplish the days work. While we did not have everything done each day that we intended we discussed it the next day and addressed any blockers that we were facing. For example when we couldn't figure out how to wire up the near me function from react to rails we both set about researching query strings and how they worked which led to the search by name function being implemented.

## Links to repos and deployed site
[Front end](https://github.com/bronwyncarr/dog_places_frontend)
[Back end](https://github.com/bronwyncarr/dog_places_backend)
[Off the leash site](https://off-the-leash.netlify.app/)
## Daily logs 
 note a pseudo daily log can be found in the testing spread sheet in the docs file under the user testing logs tab
- ### Jan 21, 2021
   Initial Read me was created and base logic for models and relations completed in the back end

- ### Jan 22 - Jan 25, 2021
  The time between the 22nd to the 25th was spent on making the Part A readme and getting the ERD and application diagrams ready for submission

- ###  Jan 27, 2021
    - Front end: 
      - Side bar created 
      - Components made for navigation utilizing React-router-dom library
      - Begin fetch calls to rails api integration
    - Back end:
      - Rails api authentication added using the Knock and JWT gems 
      - Rails model CRUD implemented 
      - Seeds file created for rails database
- ### Jan 28, 2021
  - Front end: 
      - React basic CRUD implemented for Locations 
      - Fixed fetch calls to send JWT when accessing protected routes on rails api 
  - Back end: 
      - Addressed bugs in authentication, was not sending jwt from React on each fetch call which resulted in authentication not working
      - Began investigating Auth0 gem integration
- ### Jan 29, 2021
  - Front end: 
      - Refactored auth fetch call into a reusable function 
      - Refactored locations form into a reusable component 
      - Investigated Global state implementation for React app 
  - Back end: 
    - Developed the Transform_json method to be used in all controllers to send back a standard data object for ease of use on React
    - Bullet added and data base queries optimized where possible
- ### Jan 30, 2021
  - Front end: 
    - Comments added to code
    - Authentication further integrated 
  - Back end: 
    - Favourites and review end points added 
    - began testing with http.client file and VScode extension 
    - post man requests to ensure the data return was what was intended 
- ### Jan 31, 2021
  - Front end:
    - Username added to state on sign in for use later
    - Usereducer investigated and attempted integration
    - Global context added to site 
  - Back end: 
    - Auth0 investigated further
    - Send grid integrated
    - Aws integrated
- ### Feb 1, 2021
  - Front end:
    - Refactored components to outside of app file
    - Sign out component moved into its own file for clarity 
    - Protected routes added and conditional rendering implemented to ensure the correct data was being show to the right users
    - New location fetch request revised
  - Back end: 
    - Revised end points for rails app
    - Auth0 re investigated , decided it wouldn't be necessary for this application
    - Developed Mailers for user sign up 
- ### Feb 2, 2021
  - Front end:
    - Delete button bug found and referred to backend Dev
    - Place holder search bar added 
    - Static assets added to global state
  - Back end: 
    - Delete end point bug fixed
    - Developed get_static_assets method to ensure react app only used values available to the data base
    - Added end points for favourites began investigating return values
    - Implemented logic  and allowed extra keys through params for ease of data transmission from React app
- ### Feb 3, 2021
  - Front end:
    - Implemented some conditional rendering through the use of is_admin boolean
    - implemented location presence check to ensure no errors are thrown by react if there are no locations
    - renamed and altered Auth fetch method for consistency 
    - Favourite button added 
    - Alert added for none admins to send a request to change a location 
    - Location average method implemented 
  - Back end: 
    - Admin boolean added to users model and json payload for React conditional rendering
    - Fixed routes for Reviews 
    - Review debugging, adding extra keys and ensuring the reviews get saved 
    - Delete user account function added
    - User id removed from locations model
- ### Feb 4, 2021
  - Front end:
    - Favourites logic implemented 
    - Location CRUD refactored into a hook 
    - Google map api error checking integrated 
  - Back end: 
    - Deployed to heroku 
    - CORS configuration 
    - Favourites controller overhaul, favourites now come through and return the intended data 
    - Rspec testing integration
- ### Feb 5, 2021
  - Front end:
    - JWT decoder added 
    - Images added to review form
    - Favicon added 
    - Image upload debugging 
    - Heart icon added for favourited locations 
    - User functions refactored into Hooks 
  - Back end: 
    - Bugs discovered in Aws config 
    - Location strict params removed 
    - More RSpec tests!
    - Fixed bugs in deploy, did not have aws sdk gem installed so heroku just crashed 
    - Images now attached to reviews and uploading to AWS 
- ### Feb 6, 2021
  - Front end:
    - Cypress integration 
    - Reviews given a "max" value 
    - Near me function implemented, couldn't get it working without a post request. begin investigating query strings 
    - Images  removed from locations 
  - Back end: 
    - More RSpec! Model validations added
    - Near me function currently working but only through a post request
    - Used rails route helpers to gain access to images inside the application record, required default host setup. Don't think its right
- ### Feb 7, 2021
  - Front end:
    - Cypress tests added 
    - Conditional rendering integrated for when a user has no favourites
    - Reducer reconfigured into a single dispatch call
    - Search by name function added 
    - Near me method works with query strings 
  - Back end: 
    - More RSpec tests location requests updated 
    - Attempted to re configure the transform_json method to be inside a controller, didn't work out 
    - Image bug, works locally but not on heroku? think its to do with the routes i set in the config files...
    - Near me re configured to use query strings rather than POST request 
- ### Feb 8, 2021
  - Front end:
    - Icons added for location facilities
    - image rendering for reviews logic implemented 
    - More Cypress tests! admin and regular users testing site end to end tests integrated
    - Site Styling begun
  - Back end: 
    - Search bar bug fixed
    - Review image url added to Review get request for use as secondary fetch call on loading a location
    - Google api key updated 
    - Rspec tests updated, attempted to integrate Review tests 
- ### Feb 9, 2021
  - Front end:
    - Styles finalized
    - Cypress tests reconfigured after styling blitz
    - Fixed major bug in location edit 
    - Documentation Complete!
  - Back end: 
    - Fixed minor bug in near me function 
    - Fixed major bug in location edit where react was sending too many location facilities 
    - Documentation Complete!
## Libraries/ Gems used in the project 
- ### React apis 
    - #### Testing 
      - [Cypress](https://www.cypress.io/) for testing the React end to end rendering and over all functionality of the React app
      - [jackfranklin/test-data-bot](https://github.com/jackfranklin/test-data-bot) for creating randomized seed data
    - #### Core functionality
      - [React](https://reactjs.org/) The front end was created with a create react app script and the react helpers such as react router and use state functions were imported from react 
      - [Axios](https://github.com/axios/axios) We decided to use Axios rather than Fetch because the over use of axios was better at handling errors and send requests 
      - [JWT decode](https://yarnpkg.com/package/jwt-decode) Was used to decode and persist JWTs over multiple sessions when needed
      - [React map box](https://yarnpkg.com/package/react-mapbox-gl) Was the library used to render the map present o the page along with the relevant markers for each geocoded location 
- ### Rails gems 
    - #### Testing 
      - [Rspec](https://rspec.info/) for testing the Rails API 
      - [Factory bot](https://github.com/thoughtbot/factory_bot) For consistent and usable data for testing
      - [Byebug](https://github.com/deivid-rodriguez/byebug) Rodney would be lost without this gem for debugging code , its without a doubt the most powerful gem he's ever used. 
    - #### Core functionality
      - [Ruby on Rails](https://rubyonrails.org/) the framework for the backend written in ruby 
      - [Rack cors](https://github.com/cyu/rack-cors) the gem which allows the React app to access the Rails API by configuring the cross origin services
      - [Bullet](https://github.com/flyerhzm/bullet) this gem was used to optimize the database search queries where possible 
      - [jwt](https://github.com/jwt/ruby-jwt) while it seems simple on the surface this is half of the overall authentication for the app 
      this combined with knock generates a JWT and sends it to the users which is then passed back and forth to access the restricted areas of the site
      - [Knock](https://github.com/nsarno/knock) as stated above this gem works with jwt to provide authentication between the React and rails apps.
      - [bcrypt](https://rubygems.org/gems/bcrypt/versions/3.1.12) this little guy right here is what gives us password security, basically it hashes passwords when it encounters them so that they aren't just out in the open for everyone to see
      - [sendgrid](https://github.com/sendgrid/sendgrid-ruby) while rails can send emails on its own with a little configuration send grid just provides a much easier and cleaner way to do this 
      - [aws-sdk](https://aws.amazon.com/sdk-for-ruby/) Since our application had planned to use image uploading in some form through the cloud service of amazon web services this gem allows us to store the image "off site" and keeps our heroku storage lean and leaves more room for data base content!
      - [rubocop](https://github.com/rubocop-hq/rubocop) the code formatter for the ruby language used in this app 
      - [rack reducer](https://github.com/chrisfrank/rack-reducer) allows us to filter the return of a get request by using query strings( its used for the search by location name call in react)
- ### Other noteworthy tools 
  - [Postman](https://www.postman.com/) we used a combination of postman and a vscode extension called [REST client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) for rapid api testing there is a client.http file in the rails backend if you install the extension you can make requests to the rails api and provided you log in and save the JWT returned then send it through on each request you can use it just like Postman. 
      
  - A copy of our post man logs can be found [here](./docs/Off-the-leash-postman-logs.json) bnut incase you dont want to look at JSON we made a Postman request route guide [here](https://documenter.getpostman.com/view/14438308/TW76D4aa#0fb54a36-520b-49f6-b672-6769b757334b)
     
## ℹ Purpose (R1)

> “Everyone thinks they have the best dog. And none of them are wrong.” – W.R. Purche

Over one third of households in Australia have a pet dog, giving Australia one of the highest rates of pet ownership in the world. That's over 3.6 million households with a dog eagerly waiting at the front door for it's owner, snoozing on the couch in the sun, or chasing a ball around the garden. Dogs are traditionally known as "man's best friend" and many people consider them part of their family. This app is designed to help people include their four legged family member in day-to-day activities in addition to planning outing the whole family can enjoy.

The app is designed to help people find locations and plan activities that are "dog-friendly". This might be an off-lead park, a cafe that welcomes dogs or even to Bunnings for a sausage. Users can search the location of places and see what facilities there are for them and their four legged friend.

## 🌟 Features

Off the Leash will allow users to:

- Search for places that are dog-friendly
- See locations on a map and in a list
- See a description of the place, facilities that are available, images and reviews
- Share reviews and images of places they have visited
- Add new places to the database
- Request admin modify or delete a location from the database

## 🤼 Target audience

The target audience for this app is anyone looking for places that are dog-friendly in some way. They may be looking a cafe close to home they can regularly go to, or further afield if say, they are planning a car trip and after places they can stop to stretch their dogs legs. They may be after an fenced area they can do training, information on off-lead times at a beach or just somewhere to socialise and make friends (2 and 4 legged variety).

Our hypothetical clients could be:

- A city council who wants to provide this service to their residents whilst encouraging responsible dog ownership and generating traffic for small businesses.
- A company who wants to increase their digital presence to customers of their business, for example, large food manufactures such as _Purima_ who want to promote their brand to their target audience, dog owners.

## 💻 Tech stack

### Front end

- React
- CSS/SASS

### Back end

- Ruby on Rails API
- PostgreSQL database

### Third Party

- Geolocation API
- SendGrid/Twillo
- OAuth/JWT

### Deployment

- Heroku web server for Rails database
- Netlify for React frontend

### Development/Project Management

- GitHub
- Cypress
- Trello

## 📈 Diagrams

### Dataflow Diagram (R2)

![Dataflow Diagram](./docs/diagrams/dataflow.png)

[Link to Dataflow diagram](https://drive.google.com/file/d/1ZBsxeL0t5O7q6Gafsg9uKJoZUkoQyp6M/view?usp=sharing)

### Architect Diagram (R3)

![Architecture Diagram](./docs/diagrams/architecture.png)

### ERD

![ERD](./docs/diagrams/erd.png)

[Link to ERD](https://dbdiagram.io/d/600b7dd380d742080a3785d0)

## 📋 Trello board

We used Trello as a project management tool. This helped us visualize our progress, keep track of time spent, and assign priority. We could visually see what each other were working on to stay in touch and review our progress collectively.

Trello Board at the start:

![Trello 1](./docs/trello/trello1.png)

Trello Board part way through:

![Trello 2](./docs/trello/trello2.png)
![Trello 3](./docs/trello/trello3.png)
![Trello 4](./docs/trello/trello4.png)
Trello Board at the end 
![Trello final](./docs/trello/Trello_final.png)

[Link to Trello Board](https://trello.com/b/113nxQTJ/off-the-leash)

## 🤼 User Stories (R4)

### Initial MVP

- As a user I want a convenient way to see what facilities are available so that I know what is available.
- As a user I want to see locations of facilities, so I know where it is.
- As a user I want to see facilities on a map so that I can visualize where they are.
- As a user I want to be able to add facilities so that I can contribute to the database.
- As a user I want to be able to request admin edit or delete places so that information is always up-to-date but protected from malicious behavior.
- As a user I want to be able to rate and comment on places so that there is more feedback on the location.
 ### A copy of a daily check for User stories can be found  in the user stories log tab of the excel spread sheet 
 [Spreadsheet](docs/OffTheLeashDevLog.xlsx)
### Stretch Goals

- As a user I want to see the distance of a facility based on my current location so that I know how far it is.
- As a user I want a webpage that is visually appealing with animations so that I enjoy using the website.

## 📐 Wireframes (R5)

Considering our app is about family activities and location to visit with your dog, we decided on a playful theme when designing our wireframes. Our inspiration was:

![Theme](./docs/inspo.png)

Source: <https://wearepretendfriends.com/dog-park>

Our wireframes take into account a variety of screen sizes.

Landing Page:

![Landing](./docs/wireframes/landing.png)

Individual Location:

![Location](./docs/wireframes/location.png)

Index of Results:

![Results](./docs/wireframes/results.png)

Add a New Location:

![New Location](./docs/wireframes/new.png)

Request to Modify or Delete an Existing Location:

![Modify Location](./docs/wireframes/modify.png)

Submit a Review or Upload Pictures:

![Write a review](./docs/wireframes/review.png)



