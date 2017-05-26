class CreateCoursesTests < ActiveRecord::Migration[5.0]
  def change
    create_table :courses_tests do |t|
      t.references :course, foreign_key: true
      t.references :test, foreign_key: true

      t.timestamps
    end
  end
end
