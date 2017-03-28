# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

3.times do
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

200.times do
    event = Event.create!(
        name: event_types[rand(0..7)],
        registered_app: registered_apps.sample
    )
    event.update_attribute(:created_at, rand(10.minutes .. 1.month).ago)
end

# This app is set up to send tracking data to blocmmetrics, so it is only added after seeding fake events. 
RegisteredApp.create!(
    name: "Intersellar Wiki",
    url: "https://interstellar-wiki-mftaff.c9users.io",
    user: User.last
)

puts "Seed Finished"
puts "#{User.count} users created"
puts "#{RegisteredApp.count} apps registered"
puts "#{Event.count} events created"
