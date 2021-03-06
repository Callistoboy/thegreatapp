class User < ApplicationRecord
  has_many :values, dependent: :destroy

  include Gravtastic
  gravtastic


  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true
  validates :email, presence: true, format: { with: EMAIL_FORMAT }, uniqueness: true
  before_save { self.email = email.downcase }
  has_secure_password
end
