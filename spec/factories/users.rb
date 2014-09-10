require 'faker'

FactoryGirl.define do
	factory :user do
	  username "Uma"
	  password  "password"  
	  email { "#{username}.@example.com".downcase }
	end
end
