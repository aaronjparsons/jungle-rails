class User < ActiveRecord::Base
  has_many :reviews

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    @lower_email = email.strip.downcase
    @user = User.where('lower(email) = ?', @lower_email).first

    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end
