class Project < ActiveRecord::Base
  belongs_to :user
  has_many :categories

  validates :title, presence: true,
                    uniqueness: { case_sensitive: false }

  validates :description, presence: true,
                   length: { maximum: 500 }

  validates :category, presence: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100<" },
                             default_url: ":style/project.jpg"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
