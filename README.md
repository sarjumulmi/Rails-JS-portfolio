# SurveyLance

SurveyLance is your new Survey app in the block. It allows users to create and submit surveys.
Users can create a survey, add questions and answer options to questions, and publish the survey.
Logged in users can also participate in exciting and engaging surveys posted by others.

SurveLance is created with Ruby on Rails framework.

## Setup

You will need the following software:

* Git
* Ruby
* SQLite3

Run ```bundle install``` and ```rake db:migrate``` after cloning the github repo.

```
$ git clone https://github.com/snsavage/carb_tracker.git
$ bundle install
$ rake db:migrate
$ rake db:migrate RAILS_ENV=test
```

SurveyLance uses the ```dotenv``` gem to manage environment variables.  You will need to provide the following variables in a ```.env``` file located in the project root.

```
GITHUB_KEY=<your github id here>
GITHUB_SECRET=<your github secret here>
FACEBOOK_KEY=<your facebook id here>
FACEBOOK_SECRET<your facebook secret here>
```
## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/sarjumulmi/rails-portfolio-survey-app/issues

## License

SurveyLance is released on the [MIT License](./LICENSE).
