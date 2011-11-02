class Notification
  include Mongoid::Document
  include Mongoid::Timestamps

  # Association (receiver of notification)
  belongs_to :person

  # Fields
  field :read_status, type: Boolean, default: false
end