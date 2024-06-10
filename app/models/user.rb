class User < ApplicationRecord

  has_secure_password
  has_many :todos, dependent: :destroy

  validates :username, length: { minimum: 3, maximum: 25}, uniqueness: true

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  validates :password, length: { minimum: 6, maximum: 25}

end
