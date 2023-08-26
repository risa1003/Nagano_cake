class Order < ApplicationRecord
  #enum payment_type: { credit_card: 0, bank_transfer: 1 }
  #enum status: { payment_pending: 0, payment_confirmed: 1, in_production: 2, preparing to ship: 3, shipped: 4 }
  has_many :order_details, dependent: :destroy
  belongs_to :customer

  enum payment_type: { credit_card: 0, transfer: 1 }
  enum status: { pending_payment: 0, payment_confirmed: 1, in_progress: 2, preparing_to_ship: 3, shipped: 4 }

  # validates :customer_id, presence: true
  # validates :postage, presence: true
  # validates :total_payment, presence: true
  # validates :payment_type, presence: true
  # validates :postal_code, presence: true
  # validates :address, presence: true
  # validates :receiver_name, presence: true
end