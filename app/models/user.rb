class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :first_name, presence: true, length: { minimum: 3, maximum: 30 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 6, maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true, on: :update

  has_and_belongs_to_many :courses
  has_and_belongs_to_many :groups

  has_many :answers
  has_many :user_logs

  def is_admin?
    self.role.upcase == 'ADMIN'
  end

  def is_supervisor?
    self.role.upcase == 'SUPERVISOR'
  end

end
