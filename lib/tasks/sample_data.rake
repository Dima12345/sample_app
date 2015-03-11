namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
  	unless User.where(email: "gunosada1@gmail.com").any?
	    User.create!(name: "Dima", email: "gunosada1@gmail.com",password: "qwerty",
                         password_confirmation: "qwerty", admin: true)
	    puts 'Admin created'
	end
    99.times do |n|
    	name  = Faker::Name.name
    	email = "example-#{n+1}@railstutorial.org"
    	password  = "password"
    	unless User.where(email: email).any?
    		User.create!(name: name, email: email, password: password, password_confirmation: password)
    	end
	end
	puts 'Users added'

    users = User.all.limit(6)
    50.times do
    	content = Faker::Lorem.sentence(5)
    	users.each { |user| user.microposts.create!(content: content) }
    end
    puts 'Microposts added'
  end
end