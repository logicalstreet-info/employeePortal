class Organization < ActiveRecord::Base
  acts_as_paranoid
  has_many :users
  has_many :projects
  has_many :leave_applications
  validates :name, presence: true, uniqueness: true
end
