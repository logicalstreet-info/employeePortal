class LeaveApplication < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_rich_text :description
  enum leave_type: { Other: 0, Personal: 1, Medical: 2, Family_Emergency: 3, Govt_Work: 4, Religious: 5, Bad_Weather: 6, Maternity: 7, Occasional:8 }
  enum :status, [:pending, :approved, :rejected], default: :pending
  validate :date_scope, on: :create
  before_create :set_default_status

  def total_day
    n = ((to_date - from_date) / 1.day + 1).round
    total = []
    x = from_date
    (n).times.each do | x |
      if x.day != 0
        total << x
      end
      x += 1.day
    end
    total.count
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
end