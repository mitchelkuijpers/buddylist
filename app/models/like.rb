class Like

  include Mongoid::Document
  include Mongoid::Timestamps

  # Associations
  embedded_in :likable, polymorphic: true
  belongs_to :created_by, class_name: "User"

end
