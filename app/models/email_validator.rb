# This class currently only checks to see if all of the necessary information is present
# The next step I would take would be to actually validated certain aspects of the information
# For example, checking if the `to` and `from` values are actually email addresses
# and return corresponding errors if necessary
class EmailValidator
	def initialize(content:)
		@content = content
	end

	attr_reader :content

	# Public: Validates that all of the necessary information is present
	#
	# Returns Boolean
	def validated?
		%w(to to_name from from_name subject body).each do |key|
			return false if content[key].nil?
		end
		true
	end
end
