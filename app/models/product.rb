class Product < ApplicationRecord
  has_and_belongs_to_many :orders 
  belongs_to :user
end
