class CreateGroupsTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :groups_teachers do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
