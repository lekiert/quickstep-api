class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true

      t.jsonb :answers

      t.timestamps
    end
  end
end
