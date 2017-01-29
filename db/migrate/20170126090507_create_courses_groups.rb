class CreateCoursesGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :courses_groups do |t|
      t.references :course, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
