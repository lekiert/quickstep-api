class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.references :level, foreign_key: true
      t.string :code
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :tests, [:name, :level_id]
  end
end
