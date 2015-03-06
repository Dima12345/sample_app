require 'spec_helper'

describe "AuthenticationPages" do
  subject { page }

  describe "sign in" do
  	before { visit signin_path }

  	it {should have_title('Sign in') }
  	it {should have_content('Sign in') }

  	describe "with valid data" do
  		let(:user) {FactoryGirl.create(:user)}
  		before do
  			fill_in "session_email", with: user.email.upcase
  			fill_in "session_password", with: user.password
  			click_button( "Sign in" )
  		end
  		it { should have_title(user.name) }
  		it { should have_link('Sign out', href: signout_path)}
  		it { should have_link('Profile', href: user_path(user)) }
  		it { should_not have_link('Sign in', href: signin_path)}

      describe " after log out " do
        before { click_link "Sign out" }
        it { should have_link( "Sign in" ) }
      end
  	end

 end 

 describe "error of invallid data of auth" do
 	before { visit signin_path
 			 click_button "Sign in" }

 	it { should_not have_title( 'Sign in') }
 	it { should have_selector( 'div.alert.alert-error') }

 	describe "after visit another page have flash" do
 		before {click_link( "Home" )}
 		it{should_not have_selector('div.alert.alert-error')}
 	end
 end

end
