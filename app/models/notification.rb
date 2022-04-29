class Notification < ApplicationRecord
  has_rich_text :description
  
  belongs_to :organization
  belongs_to :user

end
