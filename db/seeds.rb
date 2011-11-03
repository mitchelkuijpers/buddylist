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
Like.delete_all

# Users
users = {}
users[:teun] = User.create! name: 'Teun van Vegchel', email: 'teun@fauxbook.com', password: 'password'
users[:mitchel] = User.create!name: 'Mitchel Kuijpers', email: 'mitchel@fauxbook.com', password: 'password'
users[:danny] = User.create! name: 'Danny Cobussen', email: 'danny@fauxbook.com', password: 'password'

# Relationships
relation_teun_danny = Relationship.new users: [ users[:teun], users[:danny] ]
relation_teun_danny.relationship_roles << (RelationshipRole.new status: true, role: RelationshipRole::ROLE_FRIEND, status_user: { users[:teun].id.to_s => RelationshipRole::STATUS_ACCEPTED, users[:danny].id.to_s => RelationshipRole::STATUS_ACCEPTED })
relation_teun_danny.save!

FriendshipPost.create! description: "FRIENDSHIP", user_ids: [users[:teun].id, users[:danny].id]

relation_teun_mitchel = Relationship.new users: [ users[:teun], users[:mitchel] ]
relation_teun_mitchel.relationship_roles[0] = RelationshipRole.new status: true, role: RelationshipRole::ROLE_FRIEND, status_user: { users[:teun].id.to_s => RelationshipRole::STATUS_ACCEPTED, users[:mitchel].id.to_s => RelationshipRole::STATUS_ACCEPTED }
relation_teun_mitchel.save!

FriendshipPost.create! description: "FRIENDSHIP", user_ids: [users[:teun].id, users[:mitchel].id]

# Posts
post = StatusPost.create! description: "Geile shit ouwe..", user_ids: [users[:teun].id, users[:mitchel].id]

# Comments
comments = {}
comments[:first_comment] = Comment.create! message: "Dit ziet er inderdaad gelikt uit.", user_id: users[:danny].id, commentable: post
comments[:sec_comment]   = Comment.create! message: "I agree!", user_id: users[:mitchel].id, commentable: post

# like
Like.create! likable: comments[:sec_comment], user: users[:danny].id
Like.create! likable: comments[:sec_comment], user: users[:teun].id