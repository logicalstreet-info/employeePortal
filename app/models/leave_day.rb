class LeaveDay < ApplicationRecord
  belongs_to :organization

  validates :holiday, presence: true
end
