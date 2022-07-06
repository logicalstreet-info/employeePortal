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
  has_one :feature_flag, dependent: :destroy
  has_many :bonds, dependent: :destroy

  accepts_nested_attributes_for :feature_flag
  
  validates :name, presence: true, uniqueness: true

  def specified_role_users(role)
    users.with_role(role)
  end

  def self.calculated_lefted_leaves_of_the_month(organization)
    organization.users.each do |user|
      count = LeaveBalance.where("user_id = ? AND organization_id = ? AND (DATE(leave_date) BETWEEN ? AND ?)", user.id, organization.id, Date.today.beginning_of_month, Date.today.end_of_month).count
      u = User.find(user.id)
      total = count - 1.5 + u.lefted_leave
      if total < 0 
        u.update(lefted_leave: total) 
      else
        u.update(lefted_leave: 0.0)
      end
    end
  end

  FEATURE_FLAGS.each do |flag|
    define_method("#{flag}_on?") do
      if self.respond_to?("#{flag}_on?")
        fg = feature_flag
        if fg.send(flag) == 'on'
          true
        else 
          false
        end
      end
    end
  end
end