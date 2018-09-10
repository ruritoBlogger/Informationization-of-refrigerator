class User < ApplicationRecord

  #password setting
  has_secure_password

  validates :user_name, {presence: true}
  validates :password_digest, {presence: true}

end
