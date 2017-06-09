# Quickstep API

## Prerequisites

* Ruby >= 2.3.1
* Bundler gem >= 1.13.6 (should work on older releases, but untested)
* Rails gem >= 5.0.0.1
* PostgreSQL >= 9.6 (should work on older releases, but untested)

Installation of other packages may be necessary. If Rails refuses to cooperate with Postgres, please take a look here:
https://stackoverflow.com/questions/3116015/how-to-install-postgresqls-pg-gem-on-ubuntu

## Setting up

Just a standard Rails application setup.

1. Clone the repo
2. Set database connection params in the .env file
2. Run `bundle install`
3. Run `rails db:setup` and then `rails:db:migrate` (set RAILS_ENV if necessary)
4. Run `rails server`

## Testing

`rails test`

## Contact

In case of any issues feel free to contact me: ekiert [dot] lukasz [at] gmail [dot] com
