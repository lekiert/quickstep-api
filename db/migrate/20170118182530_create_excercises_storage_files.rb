class CreateExcercisesStorageFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :excercises_storage_files do |t|
      t.integer :storage_file_id
      t.integer :excercise_id

      t.timestamps
    end
  end
end
