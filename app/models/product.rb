class Product < ApplicationRecord
  has_many :order_items
  belongs_to :user
end
