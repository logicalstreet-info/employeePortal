class Skill < ApplicationRecord
  has_many :taggables, dependent: :destroy
  has_many :users, through: :taggables
end
