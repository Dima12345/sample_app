require 'spec_helper'

describe "StaticPages" do

	describe "Home page" do
		it "should have the content 'Sample App'" do
			visit'/static_pages/home'
			expect(page).to have_content('Sample App')
		end

		it "should have the title 'Home'" do
			visit '/static_pages/home'
			expect(page).to have_title("Ruby on rails Sample App | Home")
		end
	end

	describe "Help page" do
		it "Should have the content 'help'" do
			visit '/static_pages/help'
			expect(page).to have_content('Help')
		end

		it "should have the title 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_title("Ruby on rails Sample App | Help")
		end
	end

	describe "About page" do
		it "should have the content 'About page'" do
			visit '/static_pages/about'
			expect(page).to have_content('About')
		end

		it "should have the title 'About'" do
			visit '/static_pages/about'
			expect(page).to have_title("Ruby on rails Sample App | About")
		end
	end

	describe "Contact page" do
		it "should have the content 'Contact page'" do
			visit '/static_pages/contact'
			expect(page).to have_content('Contact')
		end

		it "should have the title 'Contact'" do
			visit '/static_pages/contact'
			expect(page).to have_title("Ruby on rails Sample App | Contact")
		end
	end

end	