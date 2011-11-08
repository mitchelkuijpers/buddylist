
# User
#
# Represents a user, a person that is registered to the application. Contains personal and authentication information.
# Used by the Devise gem for authentication.
#
class User

  include Mongoid::Document
  include Mongoid::Timestamps

  # Configure authentication modules
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_one :photo
  has_many :comments
  has_many :notifications
  has_and_belongs_to_many :relationships
  has_many :created_posts, class_name: "Post", inverse_of: :created_by
  has_many :received_posts, class_name: "Post", inverse_of: :created_for

  # Validation
  validates_presence_of :name

  # Properties
  field :name, type: String


  # Get the posts that were created by and/or for this user.
  #
  # @return [Mongoid::Criteria] Lazy query for all posts by and/or for this user, descending on _id.
  #
  def posts
    Post.where("$or" => [{ created_by_id: self.id }, { created_for_id: self.id }]).desc(:_id)
  end


  # Get all the users' friends: other users this user has an accepted Friendship relation with.
  #
  # @return [Array] List of friended Users
  #
  def friends
    friends = relationships.by_accepted_role(:friends).collect(&:users).flatten.uniq
    friends.delete(self)
    friends
  end


  def unread_notifications
    notifications.where(read_status: false)
  end

  # Checks whether two users are friends of eachother.
  #
  # @param user [User] The user that might be a friend
  # @return [Boolean] Whether the users are friends
  #
  def friend_of? user
    friends.include? user
  end


  # Checks whether the user accepted a friendship role for a certain user.
  #
  # @param user [User] The user to check for a friendship role
  # @param [Boolean] Whether the user accepted the friendship role
  #
  def requested_friend? user
    relation = Relationship.find_or_create_for_users self, user
    role     = relation.find_or_create_role :friends
    role.get_status(self) == RelationshipRole::STATUS_ACCEPTED
  end


  # Lists all users who have issued a friend request to the user.
  #
  # @return [Array] List of users
  #
  def friend_requests
    relations = relationships.by_unaccepted_role(:friends).reject do |relationship|
      role = relationship.find_or_create_role :friends
      role.get_status(self) == RelationshipRole::STATUS_ACCEPTED
    end
    friends = relations.collect(&:users).flatten.uniq
    friends.delete(self)
    friends
  end


  # Search for friends with a certain name. Uses regex for more advanced search.
  #
  # @param name [String] The friend's (partial) name
  # @return [Array] List of matching friends
  #
  def search_friends_by_name name
    name.sub! /[^ a-z]/i, ''
    self.friends.keep_if { |user| user.name =~ /#{name}/i }
  end


  # Enable updating the user profile without providing the current password
  def update_with_password params = { }
    params.delete(:current_password)
    update_without_password params
  end


  def owns? item
    if item.respond_to? :created_by
      if item.respond_to? :created_for
        item.created_by == self or item.created_for == self
      else
        item.created_by == self
      end
    else
      false
    end
  end


  def friend_of_owner? item
    if item.respond_to? :created_by
      if item.respond_to? :created_for
        self.friend_of? item.created_by or self.friend_of? item.created_for
      else
        self.friend_of? item.created_by
      end
    else
      false
    end
  end


  class << self


    # Search for users with a certain name. Uses regex for more advanced search.
    #
    # @param name [String] The user's (partial) name
    # @return [Array] List of matching users
    #
    def search_by_name name
      name.sub! /[^ a-z]/i, ''
      unless name.blank?
        where name: /#{name}/i
      else
        []
      end
    end


  end


end
