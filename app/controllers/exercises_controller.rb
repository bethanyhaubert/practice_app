class ExercisesController < ApplicationController
	skip_before_filter :verify_authenticity_token

	# This method is assuming that content is getting
	# passed in through some kind of form object.
	# to test run: `curl -d --url http://localhost:3000/email/`
	def email
		email_response = EmailHandler.new(email_content).deliver_email
			render text: email_response + "\n"
	end

	private

	def email_content
		{"to" => "bethany.haubert@gmail.com", "to_name" => "Mr. Fake", "from" => "noreply@mybrightwheel.com", "from_name" => "Brightwheel", "subject" => "A Message from Brightwheel", "body" => "<h1>Your Bill</h1><p>$10</p>"}
	end
end