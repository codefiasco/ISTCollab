class Project < ActiveRecord::Base
  belongs_to :user
  has_many :categories
  has_one :interest
  
  validates :title, presence: true,
                    uniqueness: { case_sensitive: false }

  validates :description, presence: true,
                   length: { maximum: 500 }

  validates :category, presence: true

end