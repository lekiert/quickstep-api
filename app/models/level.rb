class Level < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1 }

  has_many :courses
  has_many :tests
end
