# Noah Betzen: Peck Engineering Assessment

TODO:
- ✅ Boilerplate Phoenix app
- ✅ Schema/migrations for food truck data (Postgres)
- ✅ Tesla API client for food truck data
- ✅ CSV importer (ignoring duplicates)
- ✅ REST resource endpoints for foodtrucks
- 🔘 OpenAPI spec with `open_api_spex`
- 🔘 Basic CRUD LiveView UI for foodtrucks
- 🔘 Tests with `exvcr`

Rules for myself: (no promises though due to time)
- Run `mix format && mix lint && mix test` often
- Try not to commit anything that fails `mix lint` or `mix test`
- Shoot for a test coverage of 80% or higher for _new_ code

## Food Truck Schema

#### CSV Headers

- locationid
  - We'll use this as our integer primary key.
- Applicant
  - String.
- FacilityType
  - Could be an enum (`Push Cart`, `Truck`), but we'll leave it as a string for now.
- cnn
  - Dunno what this. It might be safest to store as a string, but it always consists of integers so we'll keep it an integer.
- LocationDescription
  - String.
- Address
  - String.
- blocklot
  - A concatenation of `block` and `lot`.
- block
  - Mostly rows are only integers but sometimes contains letters, so we'll store it as a string.
- lot
  - Mostly rows are only integers but sometimes contains letters, so we'll store it as a string.
- permit
  - String.
- Status
  - Could be an enum (`APPROVED`, `REQUESTED`, `EXPIRED`, `SUSPEND`, `ISSUED`), but we'll leave it as a string for now.
- FoodItems
  - String that we can maybe parse/split later.
- X
  - A decimal, but we'll store it as a string for now.
- Y
  - A decimal, but we'll store it as a string for now.
- Latitude
  - A decimal, but we'll store it as a string for now.
- Longitude
  - A decimal, but we'll store it as a string for now.
- Schedule
  - A URL that we'll store as a string.
- dayshours
  - String.
- NOISent
  - Always empty, dunno what this is? String for now.
- Approved
  - A datetime, but the time is always midnight.
- Received
  - A date (without time), but we'll store it as a datetime for extensibility.
- PriorPermit
  - Only ever a 0 or a 1, so we could use a boolean but just in case let's keep it an integer.
- ExpirationDate
  - A datetime, but the time is always midnight.
- Location
  - A tuple of the latitude and longitude, but we'll keep it as a string.
- Fire Prevention Districts
  - A district number. Integer seems obvious, but we'll keep it a string because it's similar to a zip code and probably won't have any math done on it.
- Police Districts
  - Similar to the fire prevention districts, so a string.
- Supervisor Districts
  - Similar to the fire prevention districts, so a string
- Zip Codes
  - Strings, just in case we ever want to support non-US postal codes. Also zip codes (which look like integers) never have math done on theem.
- Neighborhoods (old)
  - Similar to the fire prevention districts, so a string. Labelled as "old" but we'll keep it for now.

To set up the schema, we'll run:
```bash
mix phx.gen.json Food FoodTruck food_trucks \
    location_id:integer \
    applicant:string \
    facility_type:string \
    cnn:integer \
    location_description:string \
    address:string \
    blocklot:string \
    block:string \
    lot:string \
    permit:string \
    status:string \
    food_items:string \
    x:string \
    y:string \
    latitude:string \
    longitude:string \
    schedule:string \
    days_hours:string \
    noi_sent:string \
    approved:datetime \
    received:datetime \
    prior_permit:integer \
    expiration_date:datetime \
    location:string \
    fire_prevention_districts:string \
    police_districts:string \
    supervisor_districts:string \
    zip_codes:string \
    neighborhoods:string
```

`facility_type` and `status` could be enums, but we'll leave them as strings for now.

---

# The original assessment README:

# Engineering Challenge

We strive to be a practical and pragmatic team. That extends to the way that we work with you to understand if this team is a great fit for you. We want you to come away with a great understanding of the kind of things that we actually do day to day and what it is like to work in our teams.

We don't believe that whiteboard coding with someone watching over your shoulder accurately reflects our day to day. Instead we'd like to be able to discuss code that you have already written when we meet.

This can be a project of your own or a substantial pull request on an open source project, but we recognize that most people have done private or proprietary work and this engineering challenge is for you.

We realize that taking on this assignment represents a time commitment for you, and we do not take that lightly. Throughout the recruitment process we will be respectful of your time and commit to working quickly and efficiently. This will be the only technical assessment you'll be asked to do. The brief following conversations will be based on this assessment and your prior experiences.

## Challenge Guidelines

* This is meant to be an assignment that you spend approximately two to three hours of focused coding. Do not feel that you need to spend extra time to make a good impression. Smaller amounts of high quality code will let us have a much better conversation than large amounts of low quality code.

* Think of this like an open source project. Create a repo on Github, use git for source control, and use a Readme file to document what you built for the newcomer to your project.

* We build systems engineered to run in production. Given this, please organize, design, test, deploy, and document your solution as if you were going to put it into production. We completely understand this might mean you can't do much in the time budget. Prioritize production-readiness over features.

* Think out loud in your documentation. Write our tradeoffs, the thoughts behind your choices, or things you would do or do differently if you were able to spend more time on the project or do it a second time.

* We have a variety of languages and frameworks that we use, but we don't expect you to know them ahead of time. For this assignment you can make whatever choices that let you express the best solution to the problem given your knowledge and favorite tools without any restriction. Please make sure to document how to get started with your solution in terms of setup so that we'd be able to run it.

* Once this is functioning and documented to your liking, either send us a link to your public repo or compress the project directory, give the file a pithy name which includes your own name, and send the file to us.

## The Challenge

As the song says, "you've got to play the hand you're dealt", and in this case your hand is to implement something to help us manage our food truck habit.

Our team loves to eat. They are also a team that loves variety, so they also like to discover new places to eat.

In fact, we have a particular affection for food trucks. One of the great things about Food Trucks in San Francisco is that the city releases a list of them as open data.

Your assignment is to make it possible for our teams to do something interesting with this food trucks data.

This is a freeform assignment. You can write a web API that returns a set of food trucks. You can write a web frontend that visualizes the nearby food trucks for a given place. You can create a CLI that lets us get the names of all the taco trucks in the city. You can create system that spits out a container with a placeholder webpage featuring the name of each food truck to help their marketing efforts. You're not limited by these ideas at all, but hopefully those are enough help spark your own creativity.
San Francisco's food truck open dataset is [located here](https://data.sfgov.org/Economy-and-Community/Mobile-Food-Facility-Permit/rqzj-sfat/data) and there is an endpoint with a [CSV dump of the latest data here](https://data.sfgov.org/api/views/rqzj-sfat/rows.csv). We've also included a copy of the data in this repo as well.
