class CreateExcercises < ActiveRecord::Migration[5.0]
  def change
    create_table :excercises do |t|
      t.string :code, :limit => 16
      t.integer :status, :limit => 1
      t.string :name
      t.string :command
      t.integer :type, :limit => 1
      t.jsonb :data, null: false, default: '{}'

      t.timestamps
    end
  end
end
