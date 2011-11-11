# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Relationship.delete_all
Notification.delete_all
Post.delete_all
Comment.delete_all
Album.delete_all
Media.delete_all
UserTag.delete_all


# Users

users     = [
        User.create!(name: 'Teun van Vegchel', email: 'teun@fauxbook.com', password: 'password'),
        User.create!(name: 'Mitchel Kuijpers', email: 'mitchel@fauxbook.com', password: 'password'),
        User.create!(name: 'Danny Cobussen', email: 'danny@fauxbook.com', password: 'password')
]

# Relationships

relations = [
        Relationship.create!(users: [users[0], users[1]]),
        Relationship.create!(users: [users[1], users[2]])
]
roles     = [
        relations[0].roles << FriendsRelationshipRole.new(status: [RelationshipRole::STATUS_ACCEPTED, RelationshipRole::STATUS_ACCEPTED]),
        relations[1].roles << FriendsRelationshipRole.new(status: [RelationshipRole::STATUS_ACCEPTED, RelationshipRole::STATUS_ACCEPTED])
]

# Posts

posts     = [
        FriendshipPost.create!(created_by: users[0], created_for: users[1]),
        FriendshipPost.create!(created_by: users[1], created_for: users[2]),
        StatusPost.create!(description: "Coole shit ouwe..", created_by: users[0], created_for: users[1]),
        StatusPost.create!(description: "He drankorgel! Gaan we zo naar het lokaal?!", created_by: users[0], created_for: users[2]),
        StatusPost.create!(description: "Fauxbook aan het ontdekken!", created_by: users[0], created_for: users[0]),
        StatusPost.create!(description: "Even Fauxbook aan het uitproberen..", created_by: users[1], created_for: users[1]),
        StatusPost.create!(description: "Even kijken hoe cool Fauxbook is :)", created_by: users[2], created_for: users[2])
]

# Comments

comments  = [
        posts[2].comments.create!(message: "Dit ziet er inderdaad gelikt uit.", created_by: users[2]),
        posts[2].comments.create!(message: "I agree!", created_by: users[1]),
        posts[4].comments.create!(message: "Tof allemaal man!", created_by: users[1]),
        posts[5].comments.create!(message: "Coole shit man!", created_by: users[2]),
        posts[6].comments.create!(message: "Ik gebruik gewoon nog hyves hoor!", created_by: users[0])
]

# Likes

likes     = [
        comments[1].likes.create!(created_by: users[2]),
        comments[1].likes.create!(created_by: users[0]),
        posts[0].likes.create!(created_by: users[0]),
        posts[0].likes.create!(created_by: users[1]),
        posts[0].likes.create!(created_by: users[2]),
        posts[3].likes.create!(created_by: users[2]),
        posts[6].likes.create!(created_by: users[1])
]
