class Course < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1 }
  validates :description, presence: true, length: { minimum: 1 }

  # belongs_to :level
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tests
end
