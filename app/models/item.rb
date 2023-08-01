class Item < ApplicationRecord
  has_many :order_details
  has_many :cart_items
end
