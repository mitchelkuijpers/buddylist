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
Like.delete_all

users = {}
users[:teun] = User.create! name: 'Teun van Vegchel', email: 'teun@fauxbook.com', password: 'password'
users[:mitchel] = User.create!name: 'Mitchel Kuijpers', email: 'mitchel@fauxbook.com', password: 'password'
users[:danny] = User.create! name: 'Danny Cobussen', email: 'danny@fauxbook.com', password: 'password'



