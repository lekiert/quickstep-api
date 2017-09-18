class CreateExcercisesStorageFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :excercises_storage_files do |t|
      t.references :storage_file, foreign_key: true
      t.references :excercise, foreign_key: true

      t.timestamps
    end
  end
end
