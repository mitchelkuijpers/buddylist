class Sharable < Commentable

  belongs_to :person

  key :description

  timestamps!

end