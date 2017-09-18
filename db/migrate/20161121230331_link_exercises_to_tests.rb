class LinkExcercisesToTests < ActiveRecord::Migration[5.0]
  def change
    add_reference :excercises, :test, foreign_key: true
  end
end
