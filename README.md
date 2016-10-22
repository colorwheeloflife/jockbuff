
# Welcome
JockBuff is a fantasy analysis tool to improve your chances to have a championship team.
Created by Taylor Aucoin, Chad Bruhaug, Mitch O'Neill & Sarah Veness


# Deployment instructions

1. Clone the repo
2. Run `gem install bundler` (if you don't already have it installed)
3. Run `bundle install`
4. Run `bundle update`
5. Run `rake db:create`
6. Run `rake db:migrate`
7. Create a `.env` file with `YAHOO_CLIENT_ID` and `YAHOO_CLIENT_SECRET`, following directions found [here](https://developer.yahoo.com/oauth2/guide/openid_connect/getting_started.html)
8. Run `bin/rails s -b 0.0.0.0`
