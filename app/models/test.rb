class Test < ApplicationRecord
  validates :code, presence: true, length: { minimum: 1 }
  validates :name, presence: true, length: { minimum: 1 }
  validates :description, presence: true, length: { minimum: 1 }

  # belongs_to :level
  has_many :exercises
  has_and_belongs_to_many :courses
  has_many :answers
end
