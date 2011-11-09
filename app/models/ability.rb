class Ability

  include CanCan::Ability


  def initialize user

    user ||= User.new # guest user (not logged in)


    ### User ###


    can :view_friends, User do |u|
      user == u or user.friend_of? u
    end

    can :create_posts, User do |u|
      user == u or user.friend_of? u
    end

    can :view_posts, User do |u|
      #user == u or user.friend_of? u
      true
    end


    ### Posts ###


    can :view, Post do |post|
      user.owns? post or user.friend_of_owner? post
    end

    can :destroy, Post do |post|
      user.owns? post
    end


    ### Comments ###


    can :create_comment, Commentable do |commentable|
      user.owns? commentable or user.friend_of_owner? commentable
    end

    can :view, Comment do |comment|
      user.friend_of? comment.created_by or user.owns? comment.commentable or user.friend_of_owner? comment.commentable
    end

    can :destroy, Comment do |comment|
      user.owns? comment or user.owns? comment.commentable
    end


    ### Likes ###


    can :create_like, Likable do |likable|
      user.owns? likable or user.friend_of_owner? likable
    end

    can :destroy, Like do |like|
      user.owns? like or user.owns? like.likable
    end


    ### User Tags ###


    can :create, UserTag do |tag|
      user.friend_of? tag.user
    end

    can :destroy, UserTag do |tag|
      tag.user == user or user.owns? tag.taggable
    end


    ### Albums ###

    ### Photos ###


    can :view, Photo do |photo|
      user.owns? photo or user.friend_of_owner? photo
    end

  end


end
