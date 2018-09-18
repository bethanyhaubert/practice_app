# This class is responsible for formatting email content
# based on the service being used to send the email
class EmailFormatter
	require "html2text"

	def initialize(content:, service:)
		@content = content
		@service = service
	end

	attr_reader :content
	attr_reader :service

	# Public: This method formats the content for either Mandrill or Mailgun
	#
	# Returns a Hash
	def format
		if service == "mandrill"
			format_mandrill
		elsif service == "mailgun"
			format_mailgun
		end
	end

	private

	def format_mandrill
	{
		"html" => content["body"],
		"text" => Html2Text.convert(content["body"]),
		"subject" => content["subject"],
		"from_email" => content["from"],
		"from_name" => content["from_name"],
		"to" => [
			{
				"email" => content["to"],
				"name" => content["to_name"]
			}
		]
		}
	end

	def format_mailgun
		content["text"] = Html2Text.convert(content["body"])
		content
	end
end