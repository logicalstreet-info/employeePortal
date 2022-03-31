class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :properties
  has_many :projects
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :password, :confirmation => true, presence: true, :length => {:within => 6..40}, :unless => lambda { password.blank? }
  enum user_type: {trainee: 1, employee: 2}
end

 
