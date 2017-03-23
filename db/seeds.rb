# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

2.times do
    user = User.new(
        email: Faker::Internet.safe_email, 
        password: 'teatea', 
        password_confirmation: 'teatea'
    )
    user.skip_confirmation!
    user.save!
end

admin_user = User.new(
    email: 'admin@user.test', 
    password: 'teatea', 
    password_confirmation: 'teatea',
)
admin_user.skip_confirmation!
admin_user.save!

users = User.all

5.times do
    random_app_name = Faker::App.name
    
    RegisteredApp.create!(
        name: random_app_name,
        url: Faker::Internet.url("#{random_app_name}.com".downcase.gsub(" ", "")),
        user: users.sample
    )
end

registered_apps = RegisteredApp.all
event_types = ["alarm", "visit", "click", "watch", "cancel", "save", "delete", "create"]

40.times do
    Event.create!(
        name: event_types[rand(0..7)],
        registered_app: registered_apps.sample
    )
end

puts "Seed Finished"
puts "#{User.count} users created"
puts "#{RegisteredApp.count} apps registered"
puts "#{Event.count} events created"
