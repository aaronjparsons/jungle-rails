class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: {scope: :email}
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
