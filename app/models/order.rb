class Order < ApplicationRecord
  enum payment_type: { credit_card: 0, bank_transfer: 1 }
  enum status: { payment_pending: 0, payment_confirmed: 1, in_production: 2, Preparing to ship: 3, shipped: 4 }
end