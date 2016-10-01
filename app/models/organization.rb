class Organization < ActiveRecord::Base
  has_many :events

  validates :title, presence: true,
                   length: { maximum: 50 }

  validates :description, length: { maximum: 500 }

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100<" },
                             default_url: ":style/default-avatar.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
