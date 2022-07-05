class LeaveDay < ApplicationRecord
  belongs_to :organization

  validates :holiday, :name, presence: true
end
