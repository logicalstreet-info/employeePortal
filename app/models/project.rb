class Project < ApplicationRecord
  has_many :periods, dependent: :destroy
  has_many :users, through: :periods
  has_many :updates, dependent: :destroy
  belongs_to :organization
  validates :name, presence: true
end
