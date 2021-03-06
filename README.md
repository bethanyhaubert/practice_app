# README

### This application uses Ruby 2.1.1 and Rails 4.2.6.
I enjoy writing in Ruby and I'm also most efficient when using Ruby on Rails

### Some additional libraries I used were:
1. html2text - a gem that converts HTML to plain text
2. pry and pry-rails - gems that are very useful for debugging in Rails console
3. httparty - a gem I use when I need to make HTTP requests to 3rd party APIs
4. rspec-rails - my favorite testing library
5. dotenv-rails - to store my API keys

### How to use:

For initial setup, run `bundle install`

To run the application, first start your server: `rails s`

Then to test the endpoint, run: `curl -d --url http://localhost:3000/email/`

To run tests, run `bundle exec rspec`

### Some tradeoffs included:
1. Not actually testing the EmailHandler, since most of the components are tested elsewhere and stubbing the APIs for Mandrill and Mailgun felt out of scope for my time limitations
2. With more time I would also refactor my #deliver_email method into two separate classes -- one for Mandrill and one for Mailgun
3. Not fully fleshing out the validations, also due to time limitations. I would have liked to include specific error messages for which content was missing.
4. I was unable to get an email to successfully send using the Mandrill API as they required a verified sending domain, which I didn't have, and they also didn't offer a sandbox one while in test mode, so my code is based off of the documentation
