class Project < ApplicationRecord
  has_many :periods, dependent: :destroy
  has_many :users, through: :periods
  has_many :updates, dependent: :destroy
  belongs_to :organization

  validates :name, presence: true

  def self.count_hour(project, user)
    @total_hours = Update.where(project_id: project, user_id: user).sum(:total_hours)
  end
end
