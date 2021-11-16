class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: {minimum: 4}
  validates :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }
end