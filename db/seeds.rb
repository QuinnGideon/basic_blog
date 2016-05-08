# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Post.delete_all
Comment.delete_all

users = []

10.times do
users << User.create(fname: Faker::Name.first_name,lname: Faker::Name.last_name, email: Faker::Internet.email, username: Faker::Team.creature)
end

posts = []
10.times do
posts << Post.create(body: Faker::Lorem.paragraph, user_id: users.sample.id)
end

comments = []
10.times do
comments << Comment.create(body: Faker::Lorem.sentence, user_id: users.sample.id, post_id: posts.sample.id)
end




