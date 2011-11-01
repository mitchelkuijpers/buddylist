# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Person.delete_all
Post.delete_all
Comment.delete_all
Like.delete_all

users = {}
users[:teun] = User.create!(email: 'teun@fauxbook.com', password: 'password')
users[:mitchel] = User.create!(email: 'mitchel@fauxbook.com', password: 'password')
users[:danny] = User.create!(email: 'danny@fauxbook.com', password: 'password')

persons = {}
persons[:teun] = Person.create!(name: 'Teun van Vegchel', user: users[:teun])
persons[:mitchel] = Person.create!(name: 'Mitchel Kuijpers', user: users[:mitchel])
persons[:danny] = Person.create!(name: 'Danny Cobussen', user: users[:danny])



