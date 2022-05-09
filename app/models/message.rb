class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  after_create_commit {broadcast_append_to group }
  before_create :confirm_participant

  validates :body, presence: true

  def confirm_participant
    return unless group.is_private

    is_participant = Participant.where(user_id: self.user.id, group_id: self.group.id).first
    throw :abort unless is_participant
  end
end
