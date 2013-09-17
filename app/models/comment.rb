class Comment < ActiveRecord::Base
  attr_accessible :author, :content

  belongs_to :product
end
