# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



100.times do
  user = User.new
  Faker::Name.name
  user.username = Faker::Internet.user_name
  user.email = Faker::Internet.email
  user.password = 'password'
  user.password_confirmation = user.password
  user.bio = Faker::Lorem.sentence + Faker::Lorem.sentence
  user.save
  10.times do
    post = Post.new
    post.blurb = Faker::Lorem.sentence
    post.user_id = user.id
    post.save!
  end
end
