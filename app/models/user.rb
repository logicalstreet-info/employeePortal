class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :properties
  has_many :periods, dependent: :destroy
  has_many :updates
  has_many :leave_applications
  has_many :notifications
  has_many :projects, through: :periods
  has_many :messages
  has_many :participants, dependent: :destroy
  has_many :groups, through: :participants
  belongs_to :organization

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  
  enum user_type: {trainee: 1, employee: 2}
  
  after_create :assign_default_role
  after_create_commit {broadcast_append_to "users"}

  scope :all_except, ->(user) {where.not(id: user)}

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end

  def check_role
    self.has_role? :admin
  end

  def check
    self.has_role? :newuser
  end

  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png"
  end
end