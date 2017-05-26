class AddPointFactorsToExercises < ActiveRecord::Migration[5.0]
  def change
    add_column :exercises, :point_factor, :integer, default: 1
  end
end
