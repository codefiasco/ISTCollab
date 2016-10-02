class Event < ActiveRecord::Base
  belongs_to :organization
  has_many :categories

  validates :title, presence: true,
                    uniqueness: { case_sensitive: false }

  validates :description, presence: true,
                   length: { maximum: 500 }

                   has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100<" },
                                              default_url: ":style/default-avatar.png"

                   validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
