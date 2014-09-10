require 'rails_helper'

RSpec.describe User, :type => :model do

	it "has a valid factory" do
	  user = FactoryGirl.create(:user)
	  expect(user).to be_valid
	end
	
	it "is invalid without a email" do 
	  expect(FactoryGirl.build(:user, email: nil)).not_to be_valid 
	end 
	
	it "is valid with a email and without username" do 
	  expect(FactoryGirl.build(:user, email: 'umamaheshvarma.s@cognizant.com')).to be_valid 
    end 

	
end
