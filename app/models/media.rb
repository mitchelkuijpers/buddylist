class Media

  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :album
  belongs_to :created_by, class_name: "User"

end
