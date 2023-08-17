class Order < ApplicationRecord
  #enum payment_type: { credit_card: 0, bank_transfer: 1 }
  #enum status: { payment_pending: 0, payment_confirmed: 1, in_production: 2, preparing to ship: 3, shipped: 4 }
  has_many :order_details, dependent: :destroy
  belongs_to :customer

  enum payment_type: { credit_card: 0, transfer: 1 }
end