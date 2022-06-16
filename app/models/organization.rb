class Organization < ActiveRecord::Base
  acts_as_paranoid

  has_many :users, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :properties, dependent: :destroy
  has_many :leave_applications, dependent: :destroy
  has_many :leave_days, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :leave_balances, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true

  def specified_role_users(role)
    users.with_role(role)
  end
end
