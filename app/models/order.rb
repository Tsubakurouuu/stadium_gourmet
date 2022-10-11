class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details

  enum order_status: {in_production: 0, complete_production: 1, shipping: 2, sent: 3, no_customer: 4}
end
