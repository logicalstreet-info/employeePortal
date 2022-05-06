class Group < ApplicationRecord
  has_many :messages

  scope :public_groups, -> {where(is_private: false)}
  after_create_commit {broadcast_append_to "groups"}
end
