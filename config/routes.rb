Rails.application.routes.draw do
	post "email", to: "exercises#email"
end
