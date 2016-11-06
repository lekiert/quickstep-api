class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.references :level, foreign_key: true

      t.timestamps
    end
    add_index :courses, [:name, :level_id]
  end
end
