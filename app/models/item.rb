class Item < ApplicationRecord
  belongs_to :store
  belongs_to :category, optional: true
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details

  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :without_tax, presence: true, numericality: {only_integer: true}

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def with_tax_price
    (without_tax*1.1).floor
  end
end
