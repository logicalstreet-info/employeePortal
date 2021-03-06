class Group < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :users, through: :participants
  belongs_to :organization

  scope :public_groups, -> {where(is_private: false)}
  after_create_commit {broadcast_if_public }

  def broadcast_if_public
    broadcast_append_to "groups" unless self.is_private
  end

  def self.create_private_group(users, group_name, organization_id)
    single_group = Group.create(name: group_name, is_private: true, organization_id: organization_id)
    users.each do |user|
      Participant.create(user_id: user.id, group_id: single_group.id)
    end
    single_group
  end
end
