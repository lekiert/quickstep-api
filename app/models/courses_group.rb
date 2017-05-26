class CoursesGroup < ApplicationRecord
  belongs_to :course
  belongs_to :group
end
