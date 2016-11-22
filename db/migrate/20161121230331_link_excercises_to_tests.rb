class LinkExcercisesToTests < ActiveRecord::Migration[5.0]
  def change
    add_column :excercises, :test_id, :integer, foreign_key: true, :null => true
    add_index :excercises, [:code, :status, :name, :test_id]
  end
end
