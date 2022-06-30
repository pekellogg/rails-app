# rails-app
<b><h4>License Validator</h4></b><br>
This is a Rails web application that leverages the dataset provided by Data.WA API (powered by Socrata) called the "L&I Contractor License Data - General". The API publishes all WA state contractors' licenses, including various details and, most importantly, a license expiration date. <br><br>
<b>Installation</b><br>
Fork and clone this repository to your machine.<br>
If you so wish, it is most kind to request an App or API token, available here: https://dev.socrata.com/foundry/data.wa.gov/m8qx-ubtq<br>
Use command $ touch .env to create an enviroment file to house a few variables: APP_TOKEN, GITHUB_KEY, GITHUB_SECRET, PORT, and RAILS_ENV for ease of use.<br><br>
Use command $ bundle install to install dependencies.<br>
Use command $ rails s start app server.<br>
Pull requests welcomed!<br>

---------------------<br>
resources citation<br>
---------------------<br>
API: https://data.wa.gov/resource/m8qx-ubtq.json?state=WA<br>
docs: https://dev.socrata.com/foundry/data.wa.gov/m8qx-ubtq<br>
API refresh: https://data.wa.gov/Labor/L-I-Contractor-License-Data-General/m8qx-ubtq<br>
OAuth2.0: https://dev.socrata.com/docs/authentication.html<br>
auth debugging: https://dev.socrata.com/docs/authentication.html<br>
SaaS license: https://support.socrata.com/hc/en-us/articles/360019057154-Socrata-Platform-Terms-of-Service<br>
ToS: https://www.tylertech.com/terms<br>
privacy statement: https://www.tylertech.com/privacy<br>
