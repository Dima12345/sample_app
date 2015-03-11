require 'spec_helper'

describe "AuthenticationPages" do
	subject { page }

	describe "sign in" do
		before { visit signin_path }

		it {should have_title('Sign in') }
		it {should have_content('Sign in') }
		it {should_not have_link('Settings')}
		it {should_not have_link('Sign out')}

		describe "with valid data" do
			let(:user) {FactoryGirl.create(:user)}
			before { a_p_s(user) }
			it { should have_title(user.name) }
			it { should have_link('Sign out', href: signout_path)}
			it { should have_link('Profile', href: user_path(user)) }
			it { should_not have_link('Sign in', href: signin_path)}

			describe " after log out " do
				before { click_link "Sign out" }
				it { should have_link( "Sign in" ) }
			end

			describe "exit" do
				before { click_link "Sign out"}
				it {should have_link("Sign in") }

			end

		end
	end 

 describe "error of invallid data of auth" do
	before { visit signin_path
			 click_button "Sign in" }

	it { should have_title( 'Sign in') }
	it { should have_selector( 'div.alert.alert-error') }

	describe "after visit another page have flash" do
		before { click_link( "Home" )}
		it{should_not have_selector('div.alert.alert-error')}
	end
 end

 describe "autorization" do 
	describe "for non-authorizated user" do
		let(:user){FactoryGirl.create(:user)}
		
		describe "in the Users controller" do
			describe "when went to edit page" do 
				before { visit edit_user_path(user) }
				it { should have_title(full_title("Sign in"))}
			end

			describe "expect redirect" do
				before { patch user_path(user) }
				specify{expect(response).to redirect_to( signin_url ) }
			end
		end

		describe "in the Microposts controller" do

			describe "submitting to the create action" do
			  before { post microposts_path }
			  specify { expect(response).to redirect_to(signin_path) }
			end

			describe "submitting to the destroy action" do
			  before { delete micropost_path(FactoryGirl.create(:micropost)) }
			  specify { expect(response).to redirect_to(signin_path) }
			end
		end



	end
	describe "wrong user" do
		let(:user){FactoryGirl.create(:user)}
		let(:wrong_user){FactoryGirl.create(:user, :email => "wrong@user.com")}
		before do
			sign_in user, no_capybara: true
		end

	  describe "submitting a GET request to the Users#edit action" do
			before { get edit_user_path( wrong_user ) }
			specify { expect(response.body).not_to match(full_title('Edit profile')) }
			specify{ expect(response).to redirect_to( root_url ) }
		end

		describe "" do
			before do
				patch user_path(wrong_user)
			end
			#specify{ expect(response).to redirect_to( root_url )}
		end


	end

 end

end
