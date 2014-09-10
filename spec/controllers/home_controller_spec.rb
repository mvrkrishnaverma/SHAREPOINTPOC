require "rails_helper"
require 'factory_girl_rails'
describe HomeController, :type => :controller do
	
  describe "Display Login page without login" do 
	it "redirect to user login page with status 302" do
	  get :index
	  expect(response).to have_http_status(302)
	  end	
  end
 
  describe "GET #index with login as user" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end
	
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the documents into @list" do
      get :index
      expect(assigns(:list).count).to be > 0
    end
  end
end