class AddPointFactorsToExcercises < ActiveRecord::Migration[5.0]
  def change
    add_column :excercises, :point_factor, :integer, default: 1
  end
end
