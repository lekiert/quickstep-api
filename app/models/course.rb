class Course < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1 }
  validates :description, presence: true, length: { minimum: 1 }

  belongs_to :level
end
