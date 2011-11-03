class User

  include Mongoid::Document
  include Mongoid::Timestamps

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_one :photo
  has_many :comments
  has_many :notifications
  has_and_belongs_to_many :relationships
  has_and_belongs_to_many :posts

  # Validation
  validates_presence_of :name

  # Properties
  field :name, type: String
  field :favorite_color, type: String


  def friends
    users = []
    relationships.by_accepted_role(RelationshipRole::ROLE_FRIEND).each do |relation|
      users += relation.users
    end
    users.delete_if { |user| user == self }
  end


  def friend_requests
    # TODO Implement
  end


  def friend_of? person
    friends.include? person
  end


  class << self


    def search_by_name name
      name.sub! /[^a-z]/i, ''
      []
      where name: /#{name}/i unless name.blank?
    end


  end

end
