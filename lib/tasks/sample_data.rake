namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Dima",
                         email: "Gunosada1@gmail.com",
                         password: "qwerty",
                         password_confirmation: "qwerty",
                         admin: true)
  end
end