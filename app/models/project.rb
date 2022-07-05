class Project < ApplicationRecord
  has_many :periods, dependent: :destroy
  has_many :users, through: :periods
  has_many :updates, dependent: :destroy
  belongs_to :organization

  validates :name, presence: true

  def self.count_hour(project, user, start_date, end_date)
    if start_date.present? && end_date.present?
      @total_hours = Update.where("project_id = ? AND user_id = ? AND DATE(created_at) BETWEEN ? AND ?", project, user, start_date.to_date.strftime('%Y-%m-%d'), end_date.to_date.strftime('%Y-%m-%d')).sum(:total_hours)
    else
      @total_hours = Update.where("project_id = ? AND user_id = ? AND created_at BETWEEN ? AND ?", project, user, Date.today.beginning_of_month, Date.today.end_of_month).sum(:total_hours)
    end
  end
end
