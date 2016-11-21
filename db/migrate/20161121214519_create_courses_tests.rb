class CreateCoursesTests < ActiveRecord::Migration[5.0]
  def change
    create_table :courses_tests do |t|
      t.integer :course_id
      t.integer :test_id

      t.timestamps
    end
  end
end
