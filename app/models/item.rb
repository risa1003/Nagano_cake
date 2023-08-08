class Item < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  #validates :genre, presence: true
  validates :price, presence: true
  validates :is_sold, presence: true

  def get_item_image(width, height)
  #unless item_image.attached?
    #file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
    #profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #end
   item_image.variant(resize_to_limit: [width, height]).processed
  end

  def price_with_tax
    tax_rate = 0.1
    (price * (1 + tax_rate)).to_i
  end
end