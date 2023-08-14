class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  has_one_attached :image

  validates :amount, presence: true

  def subtotal
    item.price_with_tax * amount
  end
end
