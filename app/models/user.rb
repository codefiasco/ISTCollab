class User < ActiveRecord::Base
  has_many :projects

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email = email.downcase }

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  validates :name, presence: true,
                   length: { maximum: 50 }

  validates :course, presence: true,
                     length: { minimum: 2, maximum: 60 }

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/default-avatar.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_secure_password
end
