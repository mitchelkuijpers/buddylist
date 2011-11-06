class Like

  include Mongoid::Document
  include Mongoid::Timestamps

  # Associations
  embedded_in :likable
  belongs_to :user


  #def self.by_user user
  #  where user_id: user.id
  #end

end