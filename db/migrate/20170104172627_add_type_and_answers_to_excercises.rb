class AddTypeAndAnswersToExcercises < ActiveRecord::Migration[5.0]
  def change
    add_column :excercises, :excercise_type, :string
    add_column :excercises, :answers, :jsonb
  end
end
