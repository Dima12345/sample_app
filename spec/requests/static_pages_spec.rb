require 'spec_helper'

describe "StaticPages" do

subject { page }

	shared_examples_for "all static page" do
		it { should have_selector('h1', text: heading)}
		it { should have_title(full_title(page_title))}
	end

	describe "Home page" do
		before { visit root_path }
		let (:heading) { 'Sample App'}
		let (:page_title) { '' }

		it_should_behave_like "all static page" 
	    it { should_not have_title('| Home') }
	end 
	

	describe "Help page" do
		before {visit help_path}
		let (:heading) { 'Sample App' }
		let (:page_title) { '' }

		it_should_behave_like "all static page"
		it { should_not have_title('| help') }
	end

	describe "About page" do
		before { visit about_path }
		let(:heading) { 'Sample App' }
		let(:page_title) { '' }

		it_should_behave_like "all static page"
		it { should_not have_title('| about') }
	end

	describe "Contact page" do
		before { visit contact_path }
		let(:heading) { 'Sample App' }
		let(:page_title) { '' }

		it_should_behave_like "all static page"
		it { should_not have_title('| contact') }
	end

#	it "should have the right links on the layouth" do 
#		visit root_path
#		click_link "About"
#		expect(page).to have_title(full_title('About'))
#	end

end	