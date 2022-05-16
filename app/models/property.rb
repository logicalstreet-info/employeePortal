class Property < ApplicationRecord
  has_rich_text :description
  belongs_to :user
  validates :name, :description, :assets_type, :purchase_date, :warranty_month, presence: true
  validates :warranty_month, inclusion: { in: 0..120, message: 'between 0 and 120' }
  enum assets_type: { Laptop: 0, LED: 1, Mouse: 2, Keyboard: 3, CPU: 4, cable: 5 }
end
