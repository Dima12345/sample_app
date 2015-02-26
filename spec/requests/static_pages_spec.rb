require 'spec_helper'

describe "StaticPages" do

	describe "Home page" do
		it "should have the content 'Sample App'" do
	   		visit '/static_pages/home'
	    	expect(page).to have_content('Sample App')
		end

	    it "should have the base title" do
	    	visit '/static_pages/home'
	    	expect(page).to have_title("Ruby on rails Sample App")
	    end

	    it "should not have a custom page title" do
	       visit '/static_pages/home'
	       expect(page).not_to have_title('| Home')
	    end
	end 
	

	describe "Help page" do
		it "Should have the content 'help'" do
			visit '/static_pages/help'
			expect(page).to have_content('Sample App')
		end

		it "should have the title 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_title("Ruby on rails Sample App")
		end

		it "should not have a custom page title" do
			visit "/static_pages/help"
			expect(page).not_to have_title('| help')
		end
	end

	describe "About page" do
		it "should have the content 'About page'" do
			visit '/static_pages/about'
			expect(page).to have_content('About')
		end

		it "should have the title 'About'" do
			visit '/static_pages/about'
			expect(page).to have_title("Ruby on rails Sample App")
		end

		it "" do
			visit"/static_pages/about"
			expect(page).not_to have_title('| about')
		end
	end

	describe "Contact page" do
		it "should have the content 'Contact page'" do
			visit '/static_pages/contact'
			expect(page).to have_content('Contact')
		end

		it "should have the title 'Contact'" do
			visit '/static_pages/contact'
			expect(page).to have_title("Ruby on rails Sample App")
		end
	end
		it "---/----" do
			visit '/static_pages/contact'
			expect(page).not_to have_title('| contact')
		end


end	