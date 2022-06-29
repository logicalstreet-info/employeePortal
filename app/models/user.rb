class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :properties, dependent: :destroy
  has_many :periods, dependent: :destroy
  has_many :updates, dependent: :destroy
  has_many :leave_applications, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :projects, through: :periods
  has_many :messages, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :groups, through: :participants
  has_many :leave_balances, dependent: :destroy
  belongs_to :organization

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates_format_of :mobile_number, :parent_mobile_number,
    :with => /[0-9]{9}/,
    :message => " must be in xxxxxxxxxx format.",
    :allow_blank => true
  validates_length_of :mobile_number, :parent_mobile_number, is: 10,
  message: "must be 10 digit long", :allow_blank => true
  validate :validate_age
  validates_confirmation_of :password

  enum user_type: {trainee: 1, employee: 2}
  
  after_create :assign_default_role
  after_create_commit {broadcast_append_to "users"}

  scope :all_except, ->(user) {where.not(id: user)}

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end

  def has_role_admin
    self.has_role? :admin
  end

  def has_role_newuser
    self.has_role? :newuser
  end

  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def validate_age
    if birth_date.present? && birth_date > 18.years.ago
        errors.add(:birth_date, 'should be over 18 years old.')
    end
  end
end