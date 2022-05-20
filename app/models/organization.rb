class Organization < ActiveRecord::Base
  acts_as_paranoid

  has_many :users
  has_many :projects
  has_many :leave_applications
  has_many :leave_days
  has_many :notifications
  has_many :groups
  
  validates :name, presence: true, uniqueness: true
end
