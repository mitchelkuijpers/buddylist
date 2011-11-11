class PhotoPost < Post

  include Mongoid::Document

  belongs_to :photo

end
