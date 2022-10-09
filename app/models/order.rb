class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy

  enum order_status: {in_production: 0, complete_production: 1, shipping: 2, sent: 3, no_customer: 4}
end
