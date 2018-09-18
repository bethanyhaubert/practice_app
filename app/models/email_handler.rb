# This class handles the sending of emails
# Currently the default service is set to Mailgun
class EmailHandler
	include HTTParty

	EMAIL_SERVICES = %w[mandrill mailgun]

	def initialize(email_content, service="mailgun")
		@content = email_content
		@service = service
	end

	attr_reader :content
	attr_reader :service

	# Public: Formats the content then sends an email
	#
	# Returns nothing
	def deliver_email
		return not_validated_error unless EmailValidator.new(content: content).validated?
		formatted_content = EmailFormatter.new(content: content, service: service).format

		if service == "mandrill"
			self.class.base_uri "https://mandrillapp.com/api/1.0"
			response = self.class.post("/messages/send.json", body: {"key" => ENV.fetch("MANDRILL_API_KEY"), "message" => formatted_content})
			if response["status"] == "sent"
				"Yay! Your email is on it's way!!"
			else
				"Oh no. That email couldn't be delivered"
			end

		elsif service == "mailgun"
			self.class.base_uri "https://api.mailgun.net/v3/sandboxaebea391c02a4a0494ab285e2adf8170.mailgun.org"
			self.class.basic_auth 'api', ENV.fetch("MAILGUN_API_KEY")
			response = self.class.post("/messages", body: formatted_content)
			if response["message"] == "Queued. Thank you."
				"Yay! Your email is on it's way!!"
			else
				"Oh no. That email couldn't be delivered"
			end
		end
	end

	private

	def not_validated_error
		"Oops! We couldn't send that email. It's missing some important info."
	end
end

