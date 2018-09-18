require "rails_helper"

RSpec.describe EmailValidator do
	context "when initialized with content" do
		describe "validated?" do
			it "returns true if all of the necessary information is present" do
				response = described_class.new(content: valid_content)

				expect(response.validated?).to be(true)
			end

			it "returns false if any of the necessary information is missing" do
				response = described_class.new(content: invalid_content)

				expect(response.validated?).to be(false)
			end
		end

		def valid_content
			{"to" => "bethany.haubert@gmail.com",
			 "to_name" => "Mr. Fake",
			 "from" => "noreply@mybrightwheel.com",
			 "from_name" => "Brightwheel",
			 "subject" => "A Message from Brightwheel",
			 "body" => "<h1>Your Bill</h1><p>$10</p>"}
		end

		def invalid_content
			{"to" => "bethany.haubert@gmail.com",
			 "from" => "noreply@mybrightwheel.com",
			 "from_name" => "Brightwheel",
			 "subject" => "A Message from Brightwheel",
			 "body" => "<h1>Your Bill</h1><p>$10</p>"}
		end
	end
end