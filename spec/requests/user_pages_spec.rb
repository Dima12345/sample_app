require 'spec_helper'

describe "User pages" do

  subject { page }
	  describe "signup page" do
	    before { visit signup_path }

	    it { should have_content("Sign up") }
	    it { should have_title(full_title("Sign up")) }
	  end

	  describe "test of user page title and content with name" do
	  	let(:user){FactoryGirl.create(:user)}
	  	before{ visit user_path(user) }

	  	it { should have_content(user.name) }
	  	it { should have_title( full_title(user.name)) }
	  end

	  #describe "test of signup" do
#
#		  before { visit signup_path }

#		  describe "test of validn`t data on sign up" do
#		  	it " " do 
#		  		expect { click_button "create_my_account" }.not_to change(User, :count)
#		  	end
#		  end

#		  describe "test of valid data on sign up" do
#		  	before do	
#			  	fill_in "Name",         with: "Example User"
 #       		fill_in "Email",        with: "user@example.com"
  #    		  	fill_in "Password",     with: "foobar"
   #     		fill_in "Confirmation", with: "foobar"
	#		end
	#		it " " do
	#	  		expect { click_button "create_my_account" }.to change(User, :count).by(1)
	#	 	end
	#	  end
	 #end




		describe "signup page" do

		    before { visit signup_path }

		    let(:submit) { "Create my account" }

		    describe "with invalid information" do
		      it "should not create a user" do
		        expect { click_button submit }.not_to change(User, :count)
		      end
		    end

		    describe "with valid information" do
		      before do
		        fill_in "Name",         with: "Example User"
		        fill_in "Email",        with: "user@example.com"
		        fill_in "Password",     with: "foobar"
		        fill_in "Confirmation", with: "foobar"
		      end

		      it "should create a user" do
		        expect { click_button submit }.to change(User, :count).by(1)
		      end
		    end
		  end




 end