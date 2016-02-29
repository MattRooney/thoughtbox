class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true,
                    uniqueness: true

  validates :password, confirmation: true

  has_many :links
end
