require "rails_helper"

RSpec.describe EmailFormatter do
	context "when initialized with content and a service" do
		describe "format" do
			it "returns properly formatted content when the service is Mandrill" do
				service = "mandrill"

				response = described_class.new(content: content, service: service)

				expect(response.format).to be_a(Hash)
				expect(response.format).to eql(mandrill_formatted_content)
			end

			it "returns properly formatted content when the service is Mailgun" do
				service = "mailgun"

				response = described_class.new(content: content, service: service)

				expect(response.format).to be_a(Hash)
				expect(response.format).to eql(mailgun_formatted_content)
			end
		end

		def content
			{"to" => "bethany.haubert@gmail.com",
			 "to_name" => "Mr. Fake",
			 "from" => "noreply@mybrightwheel.com",
			 "from_name" => "Brightwheel",
			 "subject" => "A Message from Brightwheel",
			 "body" => "<h1>Your Bill</h1><p>$10</p>"}
		end

		def mandrill_formatted_content
			{"html"=>"<h1>Your Bill</h1><p>$10</p>",
			 "text"=>"Your Bill\n\n$10",
			 "subject"=>"A Message from Brightwheel",
			 "from_email"=>"noreply@mybrightwheel.com",
			 "from_name"=>"Brightwheel",
			 "to"=>[{"email"=>"bethany.haubert@gmail.com", "name"=>"Mr. Fake"}]}
		end

		def mailgun_formatted_content
			{"to"=>"bethany.haubert@gmail.com",
			 "to_name"=>"Mr. Fake",
			 "from"=>"noreply@mybrightwheel.com",
			 "from_name"=>"Brightwheel",
			 "subject"=>"A Message from Brightwheel",
			 "body"=>"<h1>Your Bill</h1><p>$10</p>",
			 "text"=>"Your Bill\n\n$10"}
		end
	end
end