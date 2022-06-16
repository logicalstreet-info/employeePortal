class LeaveApplication < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_rich_text :description
  enum leave_type: { Other: 0, Personal: 1, Medical: 2, Family_Emergency: 3, Govt_Work: 4, Religious: 5, Bad_Weather: 6, Maternity: 7, Occasional:8 }
  enum :status, [:pending, :approved, :rejected], default: :pending
  validates :description, :to_date, :from_date, :leave_type, presence: true
  validate :date_scope, on: :create
  before_create :set_default_status 
  after_update :add_leave_balance

  def total_day
    to_date > from_date ? n = ((to_date - from_date) / 1.day + 1).round : n = 1
    total = []
    total1 = []
    a = self.from_date
    while a <= self.to_date
      if self.organization.weekly_off.present?
        if self.organization.weekly_off.include?(a.strftime("%A"))
          total = total
        else
          total << a
        end
      else
        total << a
      end
      a += 1.day
    end
    self.organization.leave_days.each do |a|
      total1 << a.holiday
    end
    (total - total1).count
  end

  private
  def date_scope
    if to_date.present? && from_date.present? && (to_date < from_date)
      errors.add(:from_date, 'must be past to to_date or equal')
    end

    if half_day?
      errors.add(:to_time, "can't be blank") unless to_time.present?
      errors.add(:from_time, "can't be blank") unless from_time.present?
      
      if to_date.present? && from_date.present? && (to_date != from_date)
        errors.add(:to_date, '& from date must be same')
      end

    else
      errors.add(:to_time, 'must be blank if half_day not checked') if to_time.present?
      errors.add(:from_time, 'must be blank if half_day not checked') if from_time.present?
    end
  end

  def set_default_status
    self.status ||= :pending
  end

  def add_leave_balance
    if self.status == "approved"
      leave_dates = self.from_date
      while leave_dates <= self.to_date
        b = LeaveBalance.new
        b.leave_application_id = self.id
        b.user_id = self.user_id
        b.organization_id = self.organization_id
        b.leave_date = leave_dates
        b.save!
        leave_dates += 1.day
      end
    end
  end

  def self.display_month_leaves(beginning_month, end_month)
    monthly_leaves = LeaveApplication.where("(DATE(from_date) BETWEEN ? AND ?) OR (DATE(to_date) BETWEEN ? AND ?)", beginning_month, end_month, beginning_month, end_month).where(status: "approved")
  end
end 