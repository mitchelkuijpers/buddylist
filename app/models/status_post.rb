class StatusPost < Post

  # Properties
  field :description, type: String

  # Validations
  validates_presence_of :description

end