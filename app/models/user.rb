class User < ActiveRecord::Base
  has_many :reviews

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: {scope: :email}
  validates :password_confirmation, presence: true
end
