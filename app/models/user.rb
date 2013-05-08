class User < ActiveRecord::Base
  attr_accessible :user_name, :password, :password_confirmation
  has_secure_password

  before_save :create_remember_token
  validates :password_confirmation, presence: true
  validates :password, presence: true, confirmation: true, length: {within: 8..256}

  def is_logged_in_user(user)
    self == user
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
