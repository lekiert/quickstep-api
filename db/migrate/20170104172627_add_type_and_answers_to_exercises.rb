class AddTypeAndAnswersToExcercises < ActiveRecord::Migration[5.0]
  def change
    add_column :excercises, :answers, :jsonb
  end
end
