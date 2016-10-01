class Event < ActiveRecord::Base
  belongs_to :organization
  has_many :categories

  validates :title, presence: true,
                    uniqueness: { case_sensitive: false }

  validates :description, presence: true,
                   length: { maximum: 500 }

  validates :category, presence: true

end