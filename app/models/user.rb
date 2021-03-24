class User < ApplicationRecord
  has_many :messages
  validates :username, presence: true, uniqueness: {case_sensitive: false},length: {maximum: 15, minimum: 3}
  has_secure_password
end
