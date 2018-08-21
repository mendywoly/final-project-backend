class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true
  has_many :products
  has_many :fees
end
