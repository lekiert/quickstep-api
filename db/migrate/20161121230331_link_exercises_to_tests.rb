class LinkExercisesToTests < ActiveRecord::Migration[5.0]
  def change
    add_reference :exercises, :test, foreign_key: true
  end
end
