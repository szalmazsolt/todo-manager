class User < ApplicationRecord

  has_secure_password
  has_many :todos, dependent: :destroy


  validates :username, length: { minimum: 3, maximum: 25}, uniqueness: { case_sensitive: false }

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  validates :password, length: { minimum: 6, maximum: 25}, allow_nil: true

end
