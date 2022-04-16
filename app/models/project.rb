class Project < ApplicationRecord
  has_many :periods
  has_many :user, through: :periods
  has_many :updates
  belongs_to :organization
  validates :name, presence: true
end
