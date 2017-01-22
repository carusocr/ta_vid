class User < ApplicationRecord

  before_save { email.downcase! }

  validates :name, presence: true, length: {maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 120}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 8}

  has_secure_password

end