class OrderDetail < ApplicationRecord
  enum product_status: { not_started: 0, awaiting_production: 1, in_production: 2, completed: 3 }
  belongs_to :order
  belongs_to :item
end