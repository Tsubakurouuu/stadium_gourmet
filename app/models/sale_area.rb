class SaleArea < ApplicationRecord
  has_many :stores, dependent: :destroy
end
