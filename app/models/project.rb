class Project < ApplicationRecord
  has_many :periods
  has_many :user, through: :periods
end
