class Address < ApplicationRecord
  belongs_to :customer

  validates :postal_code, :address, :receiver_name, presence: true

  def address_display
    '〒' + postal_code + ' ' + address + ' ' + receiver_name
  end
end
