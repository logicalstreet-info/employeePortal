class Bond < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_rich_text :description
  validates :start_date, :end_date, presence: true
end