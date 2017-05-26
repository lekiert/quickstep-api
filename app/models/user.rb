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

  def is_teacher?
    self.role.upcase == 'TEACHER'
  end

  def set_overall_score
    result = 0.0
    count = 0
    self.answers.each do |answer|
      answer_score = answer.score
      if answer_score.is_a?(Hash)
        begin
          _score = answer_score["score"].to_f
          _max = answer_score["max"].to_f

          if _score.is_a?(Numeric) && _max.is_a?(Numeric) && _max > 0
            result += _score / _max * 100
            count += 1
          end
        rescue
        end
      end
    end

    if (count > 0)
      self.overall_score = (result / count).round
      self.save
    else
      self.overall_score = 0
    end
  end

end
