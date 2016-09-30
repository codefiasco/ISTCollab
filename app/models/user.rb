class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email = email.downcase }

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  validates :name, presence: true,
                   length: { maximum: 50 }

  validates :course, presence: true,
                     length: { minimum: 2, maximum: 60 }

  has_secure_password
end
