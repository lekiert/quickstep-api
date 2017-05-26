class AddTypeAndAnswersToExercises < ActiveRecord::Migration[5.0]
  def change
    add_column :exercises, :answers, :jsonb
  end
end
