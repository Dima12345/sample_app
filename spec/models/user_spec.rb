require 'spec_helper'

describe User do
	before{ @user = User.new(name: "Example User", email: "user@example.com",
                     password: "sfoobar", password_confirmation: "sfoobar") }

	subject{ @user }

	it{	should respond_to(:name) }
	it{ should respond_to(:email) }
	it{ should respond_to(:password_digest) }
	it{ should respond_to(:password) }
	it{ should respond_to(:password_confirmation) }
	it{ should respond_to(:authenticate)}

	it{ should be_valid }
	
	describe "when name is not present" do
		before { @user.name = " "}
		it { should_not be_valid }
	end

	describe "email" do
		before { @user.email = " " }
		it { should_not be_valid }
	end

	describe "long name" do
		before{ @user.name = "a" * 51 }
		it { should_not be_valid }
	end

	describe "invalid email" do
		it "invalid" do 
			address = %w[ user@example,ru us_er.org user.user@user.user@us_er.com user@us+er.com ]
			address.each do | invalid_address |
				@user.email = invalid_address
				expect(@user).not_to be_valid
			end
		end
	end
	describe "valid" do
		it "valid" do 
			address = %w[ user@user.us A_US-ER@u.s.ru User@us.org us+er@us.er]
			address.each do | valid_address |
				@user.email = valid_address
				expect(@user).to be_valid
			end
		end
	end

	describe "double email" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end 
		it { should_not be_valid }
	end

	describe "pass_is_null" do
		before { @user = User.new(name: "Example User", email: "user@example.com",
                       password: " ", password_confirmation: " ") }
    	it { should_not be_valid }
	end

	describe "when password doesn't match confirmation" do
	    before { @user.password_confirmation = "mismatch" }
	    it { should_not be_valid }
	end

	describe "it`s pass is short?" do
		before { @user.password = @user.password_confirmation = "a" * 3 }
		it { should be_invalid }
	end

	describe "authenticate metod" do
		before { @user.save }
		let(:found_user){ User.find_by(email: @user.email) }
	
		describe "with valid password" do
			it{ should eq found_user.authenticate( @user.password ) }
		end

		describe "invalid password" do
			let( :user_for_invalid_password ){ found_user.authenticate("invalid") }
			it { should_not eq user_for_invalid_password }
			specify {expect(user_for_invalid_password).to be_false }
		end

	end


end
