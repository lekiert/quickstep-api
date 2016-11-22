class Excercise < ApplicationRecord
  validates :code, presence: true, length: { minimum: 1, maximum: 15 }
  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :command, presence: true, length: { minimum: 3, maximum: 255 }
  validates :status, presence: true,
                     numericality: { only_integer: true,
                                     greater_than_or_equal_to: -1,
                                     less_than_or_equal_to: 1}

  belongs_to :test
end
