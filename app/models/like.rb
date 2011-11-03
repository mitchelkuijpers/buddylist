class Like

  include Mongoid::Document

  # Associations
  belongs_to :likable, polymorphic: true
  belongs_to :user


  def self.by_user user
    where user_id: user.id
  end

end