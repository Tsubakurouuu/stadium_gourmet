class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nickname, presence: true#, exclusion: { in: %w(guestuser), message: "『%{value}』は使用できません"  }
  validates :email, presence: true#, exclusion: { in: %w(guest@example.com), message: "『%{value}』は使用できません"  }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy


  def self.guest
    find_or_create_by!(nickname: 'guestuser' ,email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.nickname = "guestuser"
    end
  end
end
