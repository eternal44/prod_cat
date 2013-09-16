class Product < ActiveRecord::Base
  attr_accessible :description, :name, :pricing, :category_id
  belongs_to :category
end
