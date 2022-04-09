class Update < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :in_time, :description, :project, presence: true
  validates :out_time, comparison: { greater_than: :in_time,
  message: "must be greater than Start time." }
  #has_rich_text :description
end 
