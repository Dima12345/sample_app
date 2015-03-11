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

	describe "signup page" do
		before { visit signup_path }
		let(:submit) { "Create my account" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		#describe "after submission" do
		#	before{ click_button submit }
#
#			it { should have_title ('Sign up') }
#			it { should have_content('error')}
#		end
	

		describe "with valid information" do
			before do				
				fill_in "user_name",         with: "Example_User"
				fill_in "user_email",        with: "user@example.com"
				fill_in "user_password",     with: "foobar"
				fill_in "user_password_confirmation", with: "foobar"
			end

			it "should create a user" do
        		expect { click_button submit }.to change(User, :count).by(1)
      		end

			describe "after saving" do
				before { click_button submit }
				let (:user){ User.find_by(email: "user@example.com")}
				it { should have_title( user.name ) }
				it { should have_link("Sign out")}
				it { should_not have_selector('div.alert.alert-success' , text: "Darova")}
			end
		end
	end

	describe "edit page" do
		let(:user){FactoryGirl.create(:user) }
		before do
			sign_in user
			visit edit_user_path(user)
		end


		describe "page" do
			it { should have_title("Edit profile") }
			it { should have_button("Save changes") }
			it { should have_content("Update your profile") }
			it { should have_link("change", href: 'http://gravatar.com/emails') }
		end

		describe "invalid data" do
			before { click_button( "Save changes" ) }

			#it { should have_selector('div.alert.alert-error', text: "error") }
			it { should have_content("error") }
		end

		describe "edit valid info of user" do 
			let(:user_test_name){"Example_User"}
			let(:user_test_email){"user@example.com"}
			
			before do
				fill_in "Name", with: user_test_name
				fill_in "user_email", with: user_test_email
				fill_in "user_password", with: user.password
				fill_in "user_password_confirmation", with: user.password
				click_button "Save changes"
			end

			it { should have_title(user_test_name) }
			it { should have_selector('div.alert.alert-success', text: "updated") }
			it { should have_link("Sign out", href: signout_path) }
			specify { expect(user.reload.name).to eq user_test_name }
			specify { expect(user.reload.email).to eq user_test_email.downcase }
		end
	end

	describe "profile page microposts" do
		let(:user) { FactoryGirl.create(:user) }
		let!(:m1) { FactoryGirl.create(:micropost, user: user, content: "Foo") }
		let!(:m2) { FactoryGirl.create(:micropost, user: user, content: "Bar") }

		before { visit user_path(user) }

		it { should have_content(user.name) }
		it { should have_title(user.name) }

		describe "microposts" do
		  it { should have_content(m1.content) }
		  it { should have_content(m2.content) }
		  it { should have_content(user.microposts.count) }
		end
	end
end