class Organization < ActiveRecord::Base
  acts_as_paranoid
  validates :name, presence: true, uniqueness: true
end
